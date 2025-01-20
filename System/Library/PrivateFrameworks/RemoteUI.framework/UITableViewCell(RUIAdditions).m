@interface UITableViewCell(RUIAdditions)
- (id)ruiDetailTextLabel;
- (id)ruiEditableTextField;
- (id)ruiImageView;
- (id)ruiTextLabel;
- (id)ruiValueLabel;
@end

@implementation UITableViewCell(RUIAdditions)

- (id)ruiTextLabel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 customLinkTextLabel];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_5:
    v2 = [a1 customTextLabel];
  }
  else
  {
    v2 = [a1 textLabel];
  }
LABEL_6:
  return v2;
}

- (id)ruiDetailTextLabel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 customDetailTextLabel];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v2 = [a1 effectiveDetailTextLabel];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [a1 customLinkDetailTextLabel];
      }
      else {
      v2 = [a1 detailTextLabel];
      }
    }
  }
  return v2;
}

- (id)ruiValueLabel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 customValueLabel];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v2 = [a1 effectiveValueTextLabel];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v2 = [a1 customLinkSubLabel];
      }
      else
      {
        v2 = 0;
      }
    }
  }
  return v2;
}

- (id)ruiEditableTextField
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a1 customEditableTextField];
  }
  else {
  v2 = [a1 editableTextField];
  }
  return v2;
}

- (id)ruiImageView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 customLinkImageView];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_5:
    v2 = [a1 customImageView];
  }
  else
  {
    v2 = [a1 imageView];
  }
LABEL_6:
  return v2;
}

@end