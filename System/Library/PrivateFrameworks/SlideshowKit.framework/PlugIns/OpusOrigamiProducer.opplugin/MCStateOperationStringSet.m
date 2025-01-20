@interface MCStateOperationStringSet
+ (id)stateOperationForTargetPlugObjectID:(id)a3 withStateKey:(id)a4 andString:(id)a5;
- (MCStateOperationStringSet)initWithImprint:(id)a3;
- (NSString)string;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setString:(id)a3;
@end

@implementation MCStateOperationStringSet

+ (id)stateOperationForTargetPlugObjectID:(id)a3 withStateKey:(id)a4 andString:(id)a5
{
  v6 = +[MCStateOperation stateOperationForTargetPlugObjectID:a3 withStateKey:a4];
  v6[4] = [a5 copy];
  return v6;
}

- (MCStateOperationStringSet)initWithImprint:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCStateOperationStringSet;
  v4 = -[MCStateOperation initWithImprint:](&v6, "initWithImprint:");
  if (v4) {
    v4->_string = (NSString *)[a3 objectForKey:@"string"];
  }
  return v4;
}

- (void)demolish
{
  self->_string = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCStateOperationStringSet;
  [(MCStateOperation *)&v3 demolish];
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)MCStateOperationStringSet;
  id v3 = [(MCStateOperation *)&v7 imprint];
  v4 = v3;
  string = self->_string;
  if (string) {
    [v3 setObject:string forKey:@"string"];
  }
  return v4;
}

- (void)_copySelfToSnapshot:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCStateOperationStringSet;
  -[MCStateOperation _copySelfToSnapshot:](&v6, "_copySelfToSnapshot:");
  string = self->_string;
  if (string) {
    *((void *)a3 + 4) = [(NSString *)string copy];
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MCStateOperationStringSet;
  return objc_msgSend(-[MCStateOperation description](&v3, "description"), "stringByAppendingFormat:", @" = \"%@\"", self->_string);
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setString:(id)a3
{
}

@end