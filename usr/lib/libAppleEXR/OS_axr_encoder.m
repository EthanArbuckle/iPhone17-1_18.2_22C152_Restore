@interface OS_axr_encoder
- (NSString)debugDescription;
- (NSString)description;
- (void)dealloc;
@end

@implementation OS_axr_encoder

- (NSString)debugDescription
{
  return 0;
}

- (NSString)description
{
  return (NSString *)@"axr_encoder_t";
}

- (void)dealloc
{
  axr_encoder::~axr_encoder((axr_encoder *)self);
  v3.receiver = v2;
  v3.super_class = (Class)OS_axr_encoder;
  [(OS_axr_encoder *)&v3 dealloc];
}

@end