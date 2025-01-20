@interface TestPLCloudSharedComment
- (id)commentText;
- (id)commenterEmail;
- (id)commenterFirstName;
- (id)commenterFullName;
- (id)commenterLastName;
- (id)isMyComment;
@end

@implementation TestPLCloudSharedComment

- (id)commentText
{
  return @"Mock comment";
}

- (id)commenterFullName
{
  return @"Mock User";
}

- (id)commenterLastName
{
  return @"User";
}

- (id)commenterFirstName
{
  return @"Mock";
}

- (id)commenterEmail
{
  return @"Mock.User@test.com";
}

- (id)isMyComment
{
  return &unk_1F02D96A0;
}

@end