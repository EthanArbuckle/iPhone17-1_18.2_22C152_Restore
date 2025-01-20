@interface NSDictionary
- (BOOL)NDTWriteToBinaryFile:(id)a3;
- (BOOL)writeToBinaryFile:(id)a3;
@end

@implementation NSDictionary

- (BOOL)writeToBinaryFile:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v5 = +[NSPropertyListSerialization dataWithPropertyList:self format:200 options:0 error:&v9];
  v6 = v5;
  if (v9) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = [v5 writeToFile:v4 atomically:1];
  }

  return v7;
}

- (BOOL)NDTWriteToBinaryFile:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v5 = +[NSPropertyListSerialization dataWithPropertyList:self format:200 options:0 error:&v9];
  v6 = v5;
  if (v9) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = [v5 writeToFile:v4 atomically:1];
  }

  return v7;
}

@end