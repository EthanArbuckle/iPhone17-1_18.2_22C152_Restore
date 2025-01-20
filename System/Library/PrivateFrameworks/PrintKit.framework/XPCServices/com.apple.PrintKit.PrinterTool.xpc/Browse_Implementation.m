@interface Browse_Implementation
- (IPPSession)session;
- (id)addEntity;
- (id)removeEntity;
- (id)updateEntity;
- (void)setAddEntity:(id)a3;
- (void)setRemoveEntity:(id)a3;
- (void)setSession:(id)a3;
- (void)setUpdateEntity:(id)a3;
@end

@implementation Browse_Implementation

- (IPPSession)session
{
  return (IPPSession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
}

- (id)addEntity
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAddEntity:(id)a3
{
}

- (id)removeEntity
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setRemoveEntity:(id)a3
{
}

- (id)updateEntity
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setUpdateEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateEntity, 0);
  objc_storeStrong(&self->_removeEntity, 0);
  objc_storeStrong(&self->_addEntity, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end