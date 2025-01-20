@interface SSKDisplayAssertionPreferences
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsControlOfDisplay;
- (SSKDisplayArrangementItem)displayArrangement;
- (SSKDisplayAssertionPreferences)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)cloneMirroringMode;
- (unint64_t)hash;
- (void)setCloneMirroringMode:(unint64_t)a3;
- (void)setDisplayArrangement:(id)a3;
- (void)setWantsControlOfDisplay:(BOOL)a3;
@end

@implementation SSKDisplayAssertionPreferences

- (SSKDisplayAssertionPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSKDisplayAssertionPreferences;
  v2 = [(SSKDisplayAssertionPreferences *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_wantsControlOfDisplay = 0;
    displayArrangement = v2->_displayArrangement;
    v2->_displayArrangement = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SSKDisplayAssertionPreferences);
  [(SSKDisplayAssertionPreferences *)v4 setWantsControlOfDisplay:self->_wantsControlOfDisplay];
  [(SSKDisplayAssertionPreferences *)v4 setDisplayArrangement:self->_displayArrangement];
  [(SSKDisplayAssertionPreferences *)v4 setCloneMirroringMode:self->_cloneMirroringMode];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SSKDisplayAssertionPreferences *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_wantsControlOfDisplay == v5->_wantsControlOfDisplay
        && [(SSKDisplayArrangementItem *)self->_displayArrangement isEqual:v5->_displayArrangement]
        && self->_cloneMirroringMode == v5->_cloneMirroringMode;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendBool:self->_wantsControlOfDisplay];
  id v5 = (id)[v3 appendObject:self->_displayArrangement];
  id v6 = (id)[v3 appendUnsignedInteger:self->_cloneMirroringMode];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_wantsControlOfDisplay withName:@"wantsControl"];
  id v5 = (id)[v3 appendObject:self->_displayArrangement withName:@"arrangement"];
  unint64_t cloneMirroringMode = self->_cloneMirroringMode;
  unint64_t v7 = @"<.Invalid>";
  if (cloneMirroringMode == 1) {
    unint64_t v7 = @".Default";
  }
  if (cloneMirroringMode == 2) {
    v8 = @".Disabled";
  }
  else {
    v8 = v7;
  }
  [v3 appendString:v8 withName:@"cloneMirroringMode"];
  v9 = [v3 build];

  return v9;
}

- (BOOL)wantsControlOfDisplay
{
  return self->_wantsControlOfDisplay;
}

- (void)setWantsControlOfDisplay:(BOOL)a3
{
  self->_wantsControlOfDisplay = a3;
}

- (SSKDisplayArrangementItem)displayArrangement
{
  return self->_displayArrangement;
}

- (void)setDisplayArrangement:(id)a3
{
}

- (unint64_t)cloneMirroringMode
{
  return self->_cloneMirroringMode;
}

- (void)setCloneMirroringMode:(unint64_t)a3
{
  self->_unint64_t cloneMirroringMode = a3;
}

- (void).cxx_destruct
{
}

@end