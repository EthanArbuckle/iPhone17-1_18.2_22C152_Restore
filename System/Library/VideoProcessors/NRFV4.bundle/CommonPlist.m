@interface CommonPlist
- (CommonPlist)init;
- (int)readPlist:(id)a3;
@end

@implementation CommonPlist

- (CommonPlist)init
{
  v3.receiver = self;
  v3.super_class = (Class)CommonPlist;
  result = [(CommonPlist *)&v3 init];
  if (result) {
    result->nrfVersion = 4;
  }
  return result;
}

- (int)readPlist:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"Version"];
  v5 = v4;
  if (v4) {
    self->nrfVersion = [v4 intValue];
  }

  return 0;
}

@end