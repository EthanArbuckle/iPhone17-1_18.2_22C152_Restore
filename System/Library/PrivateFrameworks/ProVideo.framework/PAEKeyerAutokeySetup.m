@interface PAEKeyerAutokeySetup
+ (BOOL)supportsSecureCoding;
- (PAEKeyerAutokeySetup)init;
- (PAEKeyerAutokeySetup)initWithCoder:(id)a3;
- (id)initialSamples;
- (id)interpolateBetween:(id)a3 withWeight:(float)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setInitialSamples:(id)a3;
@end

@implementation PAEKeyerAutokeySetup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEKeyerAutokeySetup)init
{
  v4.receiver = self;
  v4.super_class = (Class)PAEKeyerAutokeySetup;
  v2 = [(PAEKeyerAutokeySetup *)&v4 init];
  if (v2) {
    v2->_initialSamples = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerAutokeySetup;
  [(PAEKeyerAutokeySetup *)&v3 dealloc];
}

- (PAEKeyerAutokeySetup)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PAEKeyerAutokeySetup;
  objc_super v4 = [(PAEKeyerAutokeySetup *)&v8 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    -[PAEKeyerAutokeySetup setInitialSamples:](v4, "setInitialSamples:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"InitialSamples"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)initialSamples
{
  return self->_initialSamples;
}

- (void)setInitialSamples:(id)a3
{
  id v5 = a3;

  self->_initialSamples = (NSMutableArray *)a3;
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  v7 = objc_alloc_init(PAEKeyerAutokeySetup);
  if (a4 >= 1.0) {
    p_isa = (id *)a3;
  }
  else {
    p_isa = (id *)&self->super.isa;
  }
  v7->_initialSamples = (NSMutableArray *)[p_isa[1] mutableCopy];
  return v7;
}

@end