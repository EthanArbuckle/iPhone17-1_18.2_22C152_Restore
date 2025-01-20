@interface OS_axr_part
- (NSString)debugDescription;
- (NSString)description;
- (void)dealloc;
@end

@implementation OS_axr_part

- (NSString)debugDescription
{
  uint64_t v2 = MEMORY[0x270FA5388](self, a2);
  v3 = (void *)v2;
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (v2) {
    v4 = (EncoderPart *)(v2 + 16);
  }
  else {
    v4 = 0;
  }
  __str[0] = 0;
  EncoderPart::Print(v4, __str, 0xFFFuLL);
  v6.receiver = v3;
  v6.super_class = (Class)OS_axr_part;
  return (NSString *)[NSString stringWithFormat:@"%@\n%s", -[OS_axr_part debugDescription](&v6, sel_debugDescription), __str];
}

- (NSString)description
{
  return (NSString *)@"axr_part_t";
}

- (void)dealloc
{
  EncoderPart::~EncoderPart((EncoderPart *)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_axr_part;
  [(OS_axr_part *)&v3 dealloc];
}

@end