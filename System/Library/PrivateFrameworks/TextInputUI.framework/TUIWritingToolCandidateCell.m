@interface TUIWritingToolCandidateCell
+ (id)reuseIdentifier;
- (id)cellBackgroundColor;
- (id)cellBackgroundImage;
@end

@implementation TUIWritingToolCandidateCell

+ (id)reuseIdentifier
{
  return @"TUIWritingToolCandidateCell";
}

- (id)cellBackgroundImage
{
  int v3 = [(TUIWritingToolCandidateCell *)self isHighlighted];
  v4 = [(TUICandidateBaseCell *)self style];
  v5 = v4;
  if (v3) {
    [v4 highlightedCellBackgroundImage];
  }
  else {
  v6 = [v4 cellBackgroundImage];
  }

  return v6;
}

- (id)cellBackgroundColor
{
  int v3 = [(TUIWritingToolCandidateCell *)self isHighlighted];
  v4 = [(TUICandidateBaseCell *)self style];
  v5 = v4;
  if (v3) {
    [v4 highlightedBackgroundColor];
  }
  else {
  v6 = [v4 cellBackgroundColor];
  }

  return v6;
}

@end