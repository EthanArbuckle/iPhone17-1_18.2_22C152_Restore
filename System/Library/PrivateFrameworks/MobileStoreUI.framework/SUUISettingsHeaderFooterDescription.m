@interface SUUISettingsHeaderFooterDescription
+ (Class)viewClassForSettingsHeaderFooterDescription:(id)a3;
+ (id)_settingsHeaderFooterDescriptionWithFooterElement:(id)a3;
+ (id)_settingsHeaderFooterDescriptionWithHeaderElement:(id)a3;
+ (id)settingsHeaderFooterDescriptionWithViewElement:(id)a3;
- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3;
- (SUUISettingsHeaderFooterDescription)initWithViewElement:(id)a3;
- (id)viewElement;
@end

@implementation SUUISettingsHeaderFooterDescription

- (SUUISettingsHeaderFooterDescription)initWithViewElement:(id)a3
{
  id v5 = a3;
  v6 = [(SUUISettingsHeaderFooterDescription *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewElement, a3);
  }

  return v7;
}

+ (id)settingsHeaderFooterDescriptionWithViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  if (v5 == 41)
  {
    uint64_t v6 = [a1 _settingsHeaderFooterDescriptionWithFooterElement:v4];
    goto LABEL_5;
  }
  if (v5 == 48)
  {
    uint64_t v6 = [a1 _settingsHeaderFooterDescriptionWithHeaderElement:v4];
LABEL_5:
    v7 = (void *)v6;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

+ (Class)viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return (Class)objc_msgSend(a3, "_viewClassForSettingsHeaderFooterDescription:");
}

- (id)viewElement
{
  return self->_viewElement;
}

+ (id)_settingsHeaderFooterDescriptionWithFooterElement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 children];
  uint64_t v5 = [v4 firstObject];

  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v5 elementType];
  if (v6 == 138)
  {
    v7 = off_2653FFA28;
    goto LABEL_7;
  }
  if (v6 != 12)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = off_2653FF460;
LABEL_7:
  v8 = (void *)[objc_alloc(*v7) initWithViewElement:v3];
LABEL_8:

  return v8;
}

+ (id)_settingsHeaderFooterDescriptionWithHeaderElement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 children];
  uint64_t v5 = [v4 firstObject];

  if (v5 && [v5 elementType] == 138) {
    uint64_t v6 = [(SUUISettingsHeaderFooterDescription *)[SUUITextHeaderSettingsHeaderFooterDescription alloc] initWithViewElement:v3];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end