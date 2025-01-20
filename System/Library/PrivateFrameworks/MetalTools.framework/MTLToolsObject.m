@interface MTLToolsObject
- (MTLDevice)device;
- (MTLToolsObject)initWithBaseObject:(id)a3 parent:(id)a4;
- (id)baseObject;
- (id)description;
- (id)originalObject;
- (id)parent;
- (id)strongParent;
- (void)dealloc;
- (void)setBaseObject:(id)a3;
- (void)setOriginalObject:(id)a3;
@end

@implementation MTLToolsObject

- (MTLDevice)device
{
  return (MTLDevice *)self->_device;
}

- (MTLToolsObject)initWithBaseObject:(id)a3 parent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MTLToolsObject;
  v6 = [(MTLToolsObject *)&v9 init];
  if (v6)
  {
    v6->_baseObject = (MTLToolsObject *)a3;
    v6->_parent = (MTLToolsObject *)a4;
    if (a4) {
      v7 = (MTLToolsDevice *)*((void *)a4 + 3);
    }
    else {
      v7 = 0;
    }
    v6->_device = v7;
  }
  return v6;
}

- (void)dealloc
{
  if (atomic_load((unsigned int *)&self->_externalReferences)) {
    [(MTLToolsDevice *)self->_device notifyExternalReferencesNonZeroOnDealloc:self];
  }

  v4.receiver = self;
  v4.super_class = (Class)MTLToolsObject;
  [(MTLToolsObject *)&v4 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsObject;
  return (id)[NSString stringWithFormat:@"%@ -> %@", -[MTLToolsObject description](&v3, sel_description), -[MTLToolsObject description](self->_baseObject, "description")];
}

- (id)originalObject
{
  for (i = self->_baseObject; ; i = [(MTLToolsObject *)i baseObject])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
  }
  return i;
}

- (void)setOriginalObject:(id)a3
{
  objc_super v4 = self;
  [(MTLToolsObject *)self baseObject];
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    objc_super v4 = [(MTLToolsObject *)v4 baseObject];
    [(MTLToolsObject *)v4 baseObject];
  }

  v4->_baseObject = (MTLToolsObject *)a3;
}

- (id)parent
{
  return self->_parent;
}

- (id)strongParent
{
  return self->_parent;
}

- (id)baseObject
{
  return self->_baseObject;
}

- (void)setBaseObject:(id)a3
{
}

@end