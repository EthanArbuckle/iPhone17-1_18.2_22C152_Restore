@interface TSPContainedObject
- (TSPContainedObject)initWithOwner:(id)a3;
- (TSPObject)owner;
- (id)documentRoot;
- (void)setOwner:(id)a3;
- (void)willModify;
- (void)willModifyForUpgrade;
@end

@implementation TSPContainedObject

- (TSPContainedObject)initWithOwner:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TSPContainedObject;
  v5 = [(TSPContainedObject *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_owner, v4);
  }

  return v6;
}

- (void)willModify
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  [WeakRetained willModify];
}

- (void)willModifyForUpgrade
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  [WeakRetained willModifyForUpgrade];
}

- (TSPObject)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

  return (TSPObject *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)documentRoot
{
  v2 = [(TSPContainedObject *)self owner];

  return [(TSPObject *)v2 documentRoot];
}

@end