@interface RAPPlaceClosureIssue
- (NSString)localizedName;
- (id)_initWithKind:(int64_t)a3 localizedName:(id)a4;
- (int64_t)kind;
@end

@implementation RAPPlaceClosureIssue

- (id)_initWithKind:(int64_t)a3 localizedName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RAPPlaceClosureIssue;
  v7 = [(RAPPlaceClosureIssue *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_kind = a3;
    v9 = (NSString *)[v6 copy];
    localizedName = v8->_localizedName;
    v8->_localizedName = v9;
  }
  return v8;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
}

@end