@interface NSError
- (BOOL)isFileExistsError;
@end

@implementation NSError

- (BOOL)isFileExistsError
{
  v3 = [(NSError *)self domain];
  if ([(NSString *)v3 isEqualToString:NSPOSIXErrorDomain]) {
    BOOL v4 = (id)[(NSError *)self code] == (id)17;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end