@interface ICShowIdentifierActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (ICShowIdentifierActivity)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)activityType;
- (id)activityViewController;
- (void)setIdentifier:(id)a3;
@end

@implementation ICShowIdentifierActivity

- (ICShowIdentifierActivity)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICShowIdentifierActivity;
  v5 = [(UIActivity *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICShowIdentifierActivity *)v5 setIdentifier:v4];
  }

  return v6;
}

- (id)activityViewController
{
  v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = [(ICShowIdentifierActivity *)self identifier];
  v5 = [v3 alertControllerWithTitle:v4 message:@"Copy this identifier to the clipboard?" preferredStyle:0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ICShowIdentifierActivity_activityViewController__block_invoke;
  v9[3] = &unk_1E5FDC7D8;
  v9[4] = self;
  v6 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Copy" style:0 handler:v9];
  [v5 addAction:v6];

  v7 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v5 addAction:v7];

  return v5;
}

void __50__ICShowIdentifierActivity_activityViewController__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  v3 = [*(id *)(a1 + 32) identifier];
  v5[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 setStrings:v4];
}

- (id)activityType
{
  return @"com.apple.notes.show-identifier";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end