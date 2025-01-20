@interface PGGraphMomentChange
- (NSString)momentUUID;
- (PGGraphMomentChange)initWithMomentUUID:(id)a3 updateTypes:(unint64_t)a4;
- (id)description;
- (unint64_t)type;
- (unint64_t)updateTypes;
- (void)mergeChange:(id)a3;
@end

@implementation PGGraphMomentChange

- (void).cxx_destruct
{
}

- (unint64_t)updateTypes
{
  return self->_updateTypes;
}

- (NSString)momentUUID
{
  return self->_momentUUID;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PGGraphMomentChange;
  v4 = [(PGGraphChange *)&v8 description];
  v5 = _stringForGraphMomentUpdateTypes(self->_updateTypes);
  v6 = [v3 stringWithFormat:@"%@ [updateTypes:%@][momentUUID:%@]", v4, v5, self->_momentUUID];

  return v6;
}

- (unint64_t)type
{
  return 3;
}

- (void)mergeChange:(id)a3
{
  unint64_t updateTypes = self->_updateTypes;
  self->_unint64_t updateTypes = [a3 updateTypes] | updateTypes;
}

- (PGGraphMomentChange)initWithMomentUUID:(id)a3 updateTypes:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphMomentChange;
  objc_super v8 = [(PGGraphMomentChange *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_momentUUID, a3);
    v9->_unint64_t updateTypes = a4;
  }

  return v9;
}

@end