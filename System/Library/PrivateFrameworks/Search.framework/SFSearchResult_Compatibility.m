@interface SFSearchResult_Compatibility
- (BOOL)isQuickGlance;
- (Class)classForCoder;
- (Class)classForKeyedArchiver;
- (NSString)compatibilityTitle;
- (id)debugDescription;
- (id)section_header;
- (id)simpleTitle;
- (id)uniqueIdentifier;
- (void)setCompatibilityTitle:(id)a3;
- (void)setSimpleTitle:(id)a3;
@end

@implementation SFSearchResult_Compatibility

- (id)debugDescription
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)SFSearchResult_Compatibility;
  v4 = [(SFSearchResult_SpotlightExtras *)&v12 debugDescription];
  v5 = [(SFSearchResult_Compatibility *)self sectionBundleIdentifier];
  v6 = [(SFSearchResult_Compatibility *)self title];
  v7 = [v6 text];
  uint64_t v8 = [(SFSearchResult_SpotlightExtras *)self score];
  [(SFSearchResult_SpotlightExtras *)self score];
  v10 = [v3 stringWithFormat:@"%@ %@ %@ (0x%llx, 0x%llx)", v4, v5, v7, v8, v9];

  return v10;
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)setCompatibilityTitle:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F67A90];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [(SFSearchResult_Compatibility *)self setTitle:v6];

  id v7 = [(SFSearchResult_Compatibility *)self title];
  [v7 setText:v5];
}

- (NSString)compatibilityTitle
{
  v2 = [(SFSearchResult_Compatibility *)self title];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSimpleTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(SFSearchResult_Compatibility *)self title];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F67A90]);
    [(SFSearchResult_Compatibility *)self setTitle:v6];
  }
  id v7 = [(SFSearchResult_Compatibility *)self title];
  [v7 setText:v4];
}

- (id)simpleTitle
{
  v5.receiver = self;
  v5.super_class = (Class)SFSearchResult_Compatibility;
  v2 = [(SFSearchResult_Compatibility *)&v5 title];
  v3 = [v2 text];

  return v3;
}

- (id)uniqueIdentifier
{
  v3 = [(SFSearchResult_Compatibility *)self identifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFSearchResult_Compatibility;
    id v6 = [(SFSearchResult_Compatibility *)&v8 title];
    id v5 = [v6 text];
  }

  return v5;
}

- (BOOL)isQuickGlance
{
  return 0;
}

- (id)section_header
{
  return @"missing";
}

@end