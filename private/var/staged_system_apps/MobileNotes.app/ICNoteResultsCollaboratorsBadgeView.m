@interface ICNoteResultsCollaboratorsBadgeView
- (CGSize)shadowOffset;
- (double)dimension;
- (double)shadowRadius;
- (double)spacing;
@end

@implementation ICNoteResultsCollaboratorsBadgeView

- (double)dimension
{
  if (+[UIDevice ic_isVision]) {
    return 44.0;
  }
  v4 = [(ICNoteResultsCollaboratorsBadgeView *)self traitCollection];
  if (objc_msgSend(v4, "ic_hasCompactSize")) {
    double v3 = 24.0;
  }
  else {
    double v3 = 32.0;
  }

  return v3;
}

- (CGSize)shadowOffset
{
  double v2 = 0.0;
  double v3 = 2.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)shadowRadius
{
  return 4.0;
}

- (double)spacing
{
  double v3 = -28.0;
  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    v4 = [(ICNoteResultsCollaboratorsBadgeView *)self traitCollection];
    if (objc_msgSend(v4, "ic_hasCompactSize")) {
      double v3 = -12.0;
    }
    else {
      double v3 = -16.0;
    }
  }
  return v3;
}

@end