@interface RMActivationPayload
- (RMPredicateDescription)predicateDescription;
- (id)reportDetails;
- (void)setPredicateDescription:(id)a3;
@end

@implementation RMActivationPayload

- (RMPredicateDescription)predicateDescription
{
  [(RMActivationPayload *)self willAccessValueForKey:@"predicateDescription"];
  v3 = [(RMActivationPayload *)self primitiveValueForKey:@"predicateDescription"];
  [(RMActivationPayload *)self didAccessValueForKey:@"predicateDescription"];
  if (!v3)
  {
    v4 = [(RMActivationPayload *)self predicateDescription];
    if (v4)
    {
      id v7 = 0;
      v3 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v7];
      id v5 = v7;
      if (v3)
      {
        [(RMActivationPayload *)self setPrimitiveValue:v3 forKey:@"predicateDescription"];
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        sub_10001200C();
      }
    }
    else
    {
      v3 = 0;
    }
  }

  return (RMPredicateDescription *)v3;
}

- (void)setPredicateDescription:(id)a3
{
  id v4 = a3;
  [(RMActivationPayload *)self willChangeValueForKey:@"predicateDescription"];
  [(RMActivationPayload *)self setPrimitiveValue:v4 forKey:@"predicateDescription"];
  if (v4)
  {
    id v7 = 0;
    id v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v7];
    id v6 = v7;
    if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000120A8();
    }
  }
  else
  {
    id v5 = 0;
  }
  [(RMActivationPayload *)self setPredicateDescription_:v5];
  [(RMActivationPayload *)self didChangeValueForKey:@"predicateDescription"];
}

- (id)reportDetails
{
  v13.receiver = self;
  v13.super_class = (Class)RMActivationPayload;
  v3 = [(RMDeclarationPayload *)&v13 reportDetails];
  id v4 = [v3 mutableCopy];

  id v5 = [(RMActivationPayload *)self configurationReferences];
  if ([v5 count])
  {
    id v6 = [v5 valueForKey:@"configurationIdentifier"];
    id v7 = [v6 allObjects];
    v8 = [v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
  }
  else
  {
    v8 = &__NSArray0__struct;
  }
  [v4 setObject:v8 forKeyedSubscript:@"configurationReferences"];

  v9 = [(RMActivationPayload *)self predicateDescription];
  v10 = [v9 description];
  [v4 setObject:v10 forKeyedSubscript:@"predicateDescription"];

  id v11 = [v4 copy];

  return v11;
}

@end