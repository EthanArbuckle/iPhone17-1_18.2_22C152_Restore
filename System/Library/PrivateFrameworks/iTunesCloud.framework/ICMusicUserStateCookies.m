@interface ICMusicUserStateCookies
+ (BOOL)supportsSecureCoding;
- (BOOL)isFrozen;
- (ICMusicUserStateCookies)initWithBlock:(id)a3;
- (ICMusicUserStateCookies)initWithCoder:(id)a3;
- (NSString)itfe;
- (NSString)xpab;
- (void)encodeWithCoder:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setItfe:(id)a3;
- (void)setXpab:(id)a3;
@end

@implementation ICMusicUserStateCookies

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itfe, 0);

  objc_storeStrong((id *)&self->_xpab, 0);
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (NSString)itfe
{
  return self->_itfe;
}

- (NSString)xpab
{
  return self->_xpab;
}

- (void)setXpab:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMusicUserStateCookies.m" lineNumber:67 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  xpab = self->_xpab;
  self->_xpab = v6;
}

- (void)setItfe:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (self->_frozen)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICMusicUserStateCookies.m" lineNumber:62 description:@"Attempt to mutate after being initialized."];

    id v5 = v9;
  }
  v6 = (NSString *)[v5 copy];
  itfe = self->_itfe;
  self->_itfe = v6;
}

- (ICMusicUserStateCookies)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICMusicUserStateCookies;
  id v5 = [(ICMusicUserStateCookies *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"xpab"];
    xpab = v5->_xpab;
    v5->_xpab = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itfe"];
    itfe = v5->_itfe;
    v5->_itfe = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  xpab = self->_xpab;
  id v5 = a3;
  [v5 encodeObject:xpab forKey:@"xpab"];
  [v5 encodeObject:self->_itfe forKey:@"itfe"];
}

- (ICMusicUserStateCookies)initWithBlock:(id)a3
{
  id v4 = (void (**)(id, ICMusicUserStateCookies *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMusicUserStateCookies;
  id v5 = [(ICMusicUserStateCookies *)&v7 init];
  if (v5)
  {
    v4[2](v4, v5);
    v5->_frozen = 1;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end