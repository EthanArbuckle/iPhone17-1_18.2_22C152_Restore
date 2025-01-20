@interface MBException
- (MBException)initWithCode:(int)a3 format:(id)a4;
- (MBException)initWithCode:(int)a3 format:(id)a4 args:(char *)a5;
- (id)error;
- (int)errorCode;
@end

@implementation MBException

- (MBException)initWithCode:(int)a3 format:(id)a4
{
  return [(MBException *)self initWithCode:*(void *)&a3 format:a4 args:&v5];
}

- (MBException)initWithCode:(int)a3 format:(id)a4 args:(char *)a5
{
  uint64_t v5 = *(void *)&a3;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:a4 arguments:a5];
  CFStringRef v10 = @"MBErrorCode";
  v11 = +[NSNumber numberWithInt:v5];
  v9.receiver = self;
  v9.super_class = (Class)MBException;
  return [(MBException *)&v9 initWithName:@"MBException" reason:v7 userInfo:+[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]];
}

- (int)errorCode
{
  id v2 = objc_msgSend(-[MBException userInfo](self, "userInfo"), "objectForKeyedSubscript:", @"MBErrorCode");
  return [v2 intValue];
}

- (id)error
{
  return +[MBError errorWithCode:[(MBException *)self errorCode], @"%@", [(MBException *)self reason] format];
}

@end