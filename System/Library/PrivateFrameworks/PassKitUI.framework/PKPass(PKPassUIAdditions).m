@interface PKPass(PKPassUIAdditions)
- (id)cardImageWithDimensions:()PKPassUIAdditions;
- (id)icon;
- (id)mailAttachmentIcon;
@end

@implementation PKPass(PKPassUIAdditions)

- (id)icon
{
  v2 = (void *)MEMORY[0x1A6224460]();
  v3 = (void *)MEMORY[0x1E4FB1818];
  v4 = [a1 iconImage];
  v5 = [v3 imageWithPKImage:v4];

  if (!v5)
  {
    v5 = [MEMORY[0x1E4FB1818] imageWithCGImage:PKPassIconImage() scale:0 orientation:1.0];
  }

  return v5;
}

- (id)mailAttachmentIcon
{
  v2 = (void *)MEMORY[0x1A6224460]();
  v3 = [a1 rawIcon];
  uint64_t v4 = PKPassMailAttachmentIconImage();

  v5 = [MEMORY[0x1E4FB1818] imageWithCGImage:v4 scale:0 orientation:1.0];

  return v5;
}

- (id)cardImageWithDimensions:()PKPassUIAdditions
{
  v5 = [[PKPassView alloc] initWithPass:a1 content:5 suppressedContent:4087];
  v6 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v5, "snapshotOfFrontFaceWithRequestedSize:", a2, a3);

  return v6;
}

@end