@interface ICNoteStringActivityItemSource
- (BOOL)allowsAttributedStringForActivityType:(id)a3;
- (ICNoteStringActivityItemSource)init;
- (ICNoteStringActivityItemSource)initWithTitle:(id)a3 attributedStringCreator:(id)a4;
- (NSAttributedString)attributedString;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)attributedStringCreator;
- (void)setAttributedString:(id)a3;
- (void)setAttributedStringCreator:(id)a3;
@end

@implementation ICNoteStringActivityItemSource

- (ICNoteStringActivityItemSource)init
{
  return 0;
}

- (ICNoteStringActivityItemSource)initWithTitle:(id)a3 attributedStringCreator:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICNoteStringActivityItemSource;
  v7 = [(ICNoteBaseActivityItemSource *)&v10 initWithTitle:a3];
  v8 = v7;
  if (v6)
  {
    [(ICNoteStringActivityItemSource *)v7 setAttributedStringCreator:v6];
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"attributedStringCreator" functionName:"-[ICNoteStringActivityItemSource initWithTitle:attributedStringCreator:]" simulateCrash:1 showAlert:0 format:@"attributedStringCreator is nil"];

    v8 = 0;
  }

  return v8;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (BOOL)allowsAttributedStringForActivityType:(id)a3
{
  uint64_t v3 = allowsAttributedStringForActivityType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&allowsAttributedStringForActivityType__onceToken, &__block_literal_global_59);
  }
  char v5 = [(id)allowsAttributedStringForActivityType__s_activitiesSupportingAttributedString containsObject:v4];

  return v5;
}

void __72__ICNoteStringActivityItemSource_allowsAttributedStringForActivityType___block_invoke()
{
  if (!allowsAttributedStringForActivityType__s_activitiesSupportingAttributedString)
  {
    id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F435D0], *MEMORY[0x1E4F435F8], *MEMORY[0x1E4F435C0], *MEMORY[0x1E4F435B0], *MEMORY[0x1E4F435E0], 0);
    allowsAttributedStringForActivityType__s_activitiesSupportingAttributedString = v1;
    MEMORY[0x1F41817F8](v1);
  }
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:*MEMORY[0x1E4F435B0]])
  {
    id v6 = 0;
  }
  else
  {
    v7 = [(ICNoteStringActivityItemSource *)self attributedString];

    if (!v7)
    {
      v8 = [(ICNoteStringActivityItemSource *)self attributedStringCreator];
      v9 = v8[2]();
      [(ICNoteStringActivityItemSource *)self setAttributedString:v9];
    }
    BOOL v10 = [(ICNoteStringActivityItemSource *)self allowsAttributedStringForActivityType:v5];
    v11 = [(ICNoteStringActivityItemSource *)self attributedString];
    id v6 = v11;
    if (!v10)
    {
      uint64_t v12 = [v11 string];

      id v6 = (void *)v12;
    }
  }

  return v6;
}

- (id)attributedStringCreator
{
  return self->_attributedStringCreator;
}

- (void)setAttributedStringCreator:(id)a3
{
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong(&self->_attributedStringCreator, 0);
}

@end