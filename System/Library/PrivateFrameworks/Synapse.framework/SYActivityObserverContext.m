@interface SYActivityObserverContext
+ (BOOL)supportsSecureCoding;
- (BOOL)needsCacheUpdate;
- (SYActivityObserverContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setNeedsCacheUpdate:(BOOL)a3;
@end

@implementation SYActivityObserverContext

- (void)setNeedsCacheUpdate:(BOOL)a3
{
  self->_needsCacheUpdate = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYActivityObserverContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SYActivityObserverContext;
  v5 = [(SYActivityObserverContext *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NeedsCacheUpdate"];
    v5->_needsCacheUpdate = [v6 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28ED0];
  BOOL needsCacheUpdate = self->_needsCacheUpdate;
  id v5 = a3;
  id v6 = [v3 numberWithBool:needsCacheUpdate];
  [v5 encodeObject:v6 forKey:@"NeedsCacheUpdate"];
}

- (BOOL)needsCacheUpdate
{
  return self->_needsCacheUpdate;
}

@end