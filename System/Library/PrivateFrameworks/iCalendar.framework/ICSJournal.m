@interface ICSJournal
+ (id)name;
- (BOOL)validate:(id *)a3;
@end

@implementation ICSJournal

+ (id)name
{
  return @"VJOURNAL";
}

- (BOOL)validate:(id *)a3
{
  v5 = [(ICSComponent *)self propertiesForName:@"STATUS"];

  if (v5)
  {
    unsigned int v6 = [(ICSComponent *)self status];
    unsigned int v7 = v6;
    if (v6 > 8 || ((1 << v6) & 0x1C1) == 0)
    {
      if (a3)
      {
        v9 = (void *)MEMORY[0x1E4F28C58];
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Invalid STATUS for VJOURNAL." forKey:*MEMORY[0x1E4F28568]];
        *a3 = [v9 errorWithDomain:@"com.apple.iCalendar" code:1000 userInfo:v10];
      }
      if (v7) {
        return 0;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ICSJournal;
  return [(ICSComponent *)&v11 validate:a3];
}

@end