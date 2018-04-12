rm -rf infinispan-server
cp -r /home/slaskawi/work/infinispan/infinispan/server/integration/build/target/infinispan-server-9.3.0-SNAPSHOT ./infinispan-server
cp /home/slaskawi/work/infinispan/infinispan-management-console/target/infinispan-management-console-9.2.1-SNAPSHOT.jar ./infinispan-server/modules/system/layers/base/org/jboss/as/console/ispn/infinispan-management-console-9.2.0.Final.jar
cp /home/slaskawi/work/infinispan/infinispan-listener-optimizations/target/infinispan-listener-optimizations-1.0-SNAPSHOT.jar ./infinispan-server/standalone/deployments/           
docker build -t slaskawi/jdg-summit .
docker push slaskawi/jdg-summit
