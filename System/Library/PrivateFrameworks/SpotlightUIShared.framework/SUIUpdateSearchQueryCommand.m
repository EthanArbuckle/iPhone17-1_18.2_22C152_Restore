@interface SUIUpdateSearchQueryCommand
- (SUIUpdateSearchQueryCommand)initWithCoder:(id)a3;
- (unint64_t)queryKind;
- (void)encodeWithCoder:(id)a3;
- (void)setQueryKind:(unint64_t)a3;
@end

@implementation SUIUpdateSearchQueryCommand

- (SUIUpdateSearchQueryCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUIUpdateSearchQueryCommand;
  v5 = [(SUIUpdateSearchQueryCommand *)&v7 initWithCoder:v4];
  if (v5) {
    -[SUIUpdateSearchQueryCommand setQueryKind:](v5, "setQueryKind:", [v4 decodeIntegerForKey:@"queryKind"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUIUpdateSearchQueryCommand;
  id v4 = a3;
  [(SUIUpdateSearchQueryCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[SUIUpdateSearchQueryCommand queryKind](self, "queryKind", v5.receiver, v5.super_class), @"queryKind");
}

- (unint64_t)queryKind
{
  return self->_queryKind;
}

- (void)setQueryKind:(unint64_t)a3
{
  self->_queryKind = a3;
}

@end