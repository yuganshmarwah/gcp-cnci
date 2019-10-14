apiVersion: apps/v1
kind: Deployment
metadata:
  name: gcp-cnci-example-app-production
  labels:
    app: gcp-cnci-example-app-production
spec:
  replicas: 1
  selector:
    matchLabels:
      app: gcp-cnci-example-app-production
  template:
    metadata:
      labels:
        app: gcp-cnci-example-app-production
    spec:
      containers:
      - name: gcp-cnci-example-app-production
        image: IMAGE_TO_DEPLOY
        ports:
        - containerPort: 8080
        env:
        - name: ENVIRONMENT_NAME
          value: "production"
---
kind: Service
apiVersion: v1
metadata:
  name: gcp-cnci-example-app-production
spec:
  selector:
    app: gcp-cnci-example-app-production
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer
