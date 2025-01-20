@interface REMComplicationDataViewFetchModelInvocation
+ (BOOL)supportsSecureCoding;
- (REMComplicationDataViewFetchModelInvocation)init;
- (REMComplicationDataViewFetchModelInvocation)initWithCoder:(id)a3;
@end

@implementation REMComplicationDataViewFetchModelInvocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMComplicationDataViewFetchModelInvocation)initWithCoder:(id)a3
{
  return [(REMComplicationDataViewFetchModelInvocation *)self init];
}

- (REMComplicationDataViewFetchModelInvocation)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(REMStoreInvocationValueStorage *)&v3 init];
}

@end