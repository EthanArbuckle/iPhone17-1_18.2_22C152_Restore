@interface NUTrait
- (NSMutableDictionary)traitBlocks;
- (NUTrait)init;
- (NUTrait)initWithDefaultValue:(double)a3;
- (double)defaultValue;
- (double)valueForTraitCollection:(id)a3 size:(CGSize)a4;
- (double)valueForTraitCollection:(id)a3 size:(CGSize)a4 deviceTrait:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)when:(unint64_t)a3 block:(id)a4;
@end

@implementation NUTrait

- (NUTrait)init
{
  return [(NUTrait *)self initWithDefaultValue:0.0];
}

- (NUTrait)initWithDefaultValue:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUTrait;
  v4 = [(NUTrait *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    traitBlocks = v4->_traitBlocks;
    v4->_traitBlocks = v5;

    v4->_defaultValue = a3;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [NUTrait alloc];
  [(NUTrait *)self defaultValue];
  v6 = -[NUTrait initWithDefaultValue:](v5, "initWithDefaultValue:");
  v7 = [(NUTrait *)self traitBlocks];
  uint64_t v8 = [v7 copyWithZone:a3];
  traitBlocks = v6->_traitBlocks;
  v6->_traitBlocks = (NSMutableDictionary *)v8;

  [(NUTrait *)self defaultValue];
  v6->_defaultValue = v10;
  return v6;
}

- (id)when:(unint64_t)a3 block:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  if (v4)
  {
    double v10 = [(NUTrait *)self traitBlocks];
    v11 = (void *)MEMORY[0x223C968A0](v6);
    [v10 setObject:v11 forKey:&unk_26D4A8DF8];

    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  v12 = [(NUTrait *)self traitBlocks];
  v13 = (void *)MEMORY[0x223C968A0](v6);
  [v12 setObject:v13 forKey:&unk_26D4A8E10];

  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    v16 = [(NUTrait *)self traitBlocks];
    v17 = (void *)MEMORY[0x223C968A0](v6);
    [v16 setObject:v17 forKey:&unk_26D4A8E40];

    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  v14 = [(NUTrait *)self traitBlocks];
  v15 = (void *)MEMORY[0x223C968A0](v6);
  [v14 setObject:v15 forKey:&unk_26D4A8E28];

  if ((v4 & 8) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((v4 & 0x10) != 0)
  {
LABEL_6:
    v7 = [(NUTrait *)self traitBlocks];
    uint64_t v8 = (void *)MEMORY[0x223C968A0](v6);
    [v7 setObject:v8 forKey:&unk_26D4A8E58];
  }
LABEL_7:

  return self;
}

- (double)valueForTraitCollection:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  uint64_t v8 = NUDeviceTraitLookup();
  -[NUTrait valueForTraitCollection:size:deviceTrait:](self, "valueForTraitCollection:size:deviceTrait:", v7, v8, width, height);
  double v10 = v9;

  return v10;
}

- (double)valueForTraitCollection:(id)a3 size:(CGSize)a4 deviceTrait:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  uint64_t v10 = NUTraitOptionFromUITraitCollection(a3);
  v11 = [(NUTrait *)self traitBlocks];
  v12 = [NSNumber numberWithUnsignedInteger:v10];
  v13 = [v11 objectForKey:v12];

  if (v13) {
    ((void (**)(void, id, double, double))v13)[2](v13, v9, width, height);
  }
  else {
    [(NUTrait *)self defaultValue];
  }
  double v15 = v14;

  return v15;
}

- (double)defaultValue
{
  return self->_defaultValue;
}

- (NSMutableDictionary)traitBlocks
{
  return self->_traitBlocks;
}

- (void).cxx_destruct
{
}

@end