@interface CACContactDisambiguationItem
- (CACContactDisambiguationItem)initWithContact:(id)a3 labeledValue:(id)a4 type:(int64_t)a5;
- (CNContact)contact;
- (CNLabeledValue)contactLabeledValue;
- (NSString)contactDisplayLabel;
- (NSString)contactDisplayValue;
- (id)displayDescription;
- (id)displayName;
- (void)setContact:(id)a3;
- (void)setContactLabeledValue:(id)a3;
- (void)startInteraction;
@end

@implementation CACContactDisambiguationItem

- (CACContactDisambiguationItem)initWithContact:(id)a3 labeledValue:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CACContactDisambiguationItem;
  v10 = [(CACContactDisambiguationItem *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(CACContactDisambiguationItem *)v10 setContact:v8];
    [(CACContactDisambiguationItem *)v11 setContactLabeledValue:v9];
    [(CACDisambiguationItem *)v11 setType:a5];
  }

  return v11;
}

- (void)startInteraction
{
  if ([(CACDisambiguationItem *)self type] == 1)
  {
    id v4 = [(CACContactDisambiguationItem *)self contact];
    v3 = [(CACContactDisambiguationItem *)self contactLabeledValue];
    [v4 callNumberWithLabeledValue:v3];
  }
  else
  {
    if ([(CACDisambiguationItem *)self type] != 2) {
      return;
    }
    id v4 = [(CACContactDisambiguationItem *)self contact];
    v3 = [(CACContactDisambiguationItem *)self contactLabeledValue];
    [v4 faceTimeEmailWithLabeledValue:v3];
  }
}

- (id)displayName
{
  return (id)[MEMORY[0x263EFEA20] stringFromContact:self->_contact style:0];
}

- (NSString)contactDisplayLabel
{
  v2 = (void *)MEMORY[0x263EFEAD0];
  v3 = [(CNLabeledValue *)self->_contactLabeledValue label];
  id v4 = [v2 localizedStringForLabel:v3];

  return (NSString *)v4;
}

- (NSString)contactDisplayValue
{
  v3 = [(CNLabeledValue *)self->_contactLabeledValue value];
  char v4 = objc_opt_respondsToSelector();
  v5 = [(CNLabeledValue *)self->_contactLabeledValue value];
  v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 stringValue];

    v6 = (void *)v7;
  }

  return (NSString *)v6;
}

- (id)displayDescription
{
  v3 = NSString;
  char v4 = +[CACLocaleUtilities localizedUIStringForKey:@"DialMessage.LabeledNumberFormat"];
  v5 = [(CACContactDisambiguationItem *)self contactDisplayLabel];
  v6 = [(CACContactDisambiguationItem *)self contactDisplayValue];
  uint64_t v7 = [v3 stringWithValidatedFormat:v4, @"%@%@", 0, v5, v6 validFormatSpecifiers error];

  return v7;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (CNLabeledValue)contactLabeledValue
{
  return self->_contactLabeledValue;
}

- (void)setContactLabeledValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactLabeledValue, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end