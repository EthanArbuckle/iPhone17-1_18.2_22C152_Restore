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
  v11[1] = *MEMORY[0x1E4F143B8];
  id v7 = (id)[[NSString alloc] initWithFormat:a4 arguments:a5];
  v10 = @"MBErrorCode";
  v11[0] = [NSNumber numberWithInt:v5];
  v9.receiver = self;
  v9.super_class = (Class)MBException;
  return -[MBException initWithName:reason:userInfo:](&v9, sel_initWithName_reason_userInfo_, @"MBException", v7, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1]);
}

- (int)errorCode
{
  v2 = objc_msgSend((id)-[MBException userInfo](self, "userInfo"), "objectForKeyedSubscript:", @"MBErrorCode");
  return [v2 intValue];
}

- (id)error
{
  return +[MBError errorWithCode:[(MBException *)self errorCode], @"%@", [(MBException *)self reason] format];
}

@end