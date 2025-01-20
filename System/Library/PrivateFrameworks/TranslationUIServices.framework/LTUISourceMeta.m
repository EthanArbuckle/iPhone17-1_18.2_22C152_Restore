@interface LTUISourceMeta
- (LTUISourceMeta)init;
- (NSArray)languageHints;
- (NSString)context;
- (id)dictionaryRepresentation;
- (unint64_t)origin;
- (void)setContext:(id)a3;
- (void)setLanguageHints:(id)a3;
- (void)setOrigin:(unint64_t)a3;
@end

@implementation LTUISourceMeta

- (LTUISourceMeta)init
{
  v7.receiver = self;
  v7.super_class = (Class)LTUISourceMeta;
  v2 = [(LTUISourceMeta *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_origin = 0;
    languageHints = v2->_languageHints;
    v2->_languageHints = (NSArray *)MEMORY[0x263EFFA68];

    v5 = v3;
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  v12[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9A0];
  v11[0] = @"origin";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[LTUISourceMeta origin](self, "origin"));
  v11[1] = @"languageHints";
  v12[0] = v4;
  v5 = [(LTUISourceMeta *)self languageHints];
  v12[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  objc_super v7 = [v3 dictionaryWithDictionary:v6];

  v8 = [(LTUISourceMeta *)self context];

  if (v8)
  {
    v9 = [(LTUISourceMeta *)self context];
    [v7 setObject:v9 forKeyedSubscript:@"context"];
  }

  return v7;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(unint64_t)a3
{
  self->_origin = a3;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)languageHints
{
  return self->_languageHints;
}

- (void)setLanguageHints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageHints, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end