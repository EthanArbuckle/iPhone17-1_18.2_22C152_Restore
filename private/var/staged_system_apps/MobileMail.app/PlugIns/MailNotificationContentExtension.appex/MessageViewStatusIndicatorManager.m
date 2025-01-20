@interface MessageViewStatusIndicatorManager
- (NSArray)statusIndicatorImageViews;
- (id)_accessibilityIdentifierForIndicatorOptions:(unint64_t)a3;
- (void)updateImageViews;
@end

@implementation MessageViewStatusIndicatorManager

- (void)updateImageViews
{
  unint64_t v3 = [(MessageStatusIndicatorManager *)self effectiveIndicatorOptions];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = self->_statusIndicatorImageViews;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) setHidden:1 v17];
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  if (v3)
  {
    if (!self->_statusIndicatorImageViews)
    {
      v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      statusIndicatorImageViews = self->_statusIndicatorImageViews;
      self->_statusIndicatorImageViews = v8;
    }
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = qword_10003AAA8[v10];
      if ((v12 & v3) != 0)
      {
        v13 = [(MessageStatusIndicatorManager *)self statusIndicatorColorWithOptionsMask:qword_10003AAA8[v10]];
        v14 = [(MessageStatusIndicatorManager *)self statusIndicatorImageWithOptionsMask:v12];
        if (v11 >= (unint64_t)[(NSMutableArray *)self->_statusIndicatorImageViews count])
        {
          id v15 = [objc_alloc((Class)UIImageView) initWithImage:0];
          -[NSMutableArray addObject:](self->_statusIndicatorImageViews, "addObject:");
        }
        else
        {
          id v15 = [(NSMutableArray *)self->_statusIndicatorImageViews objectAtIndex:v11];
        }
        [v15 setHidden:0, v17];
        [v15 setImage:v14];
        v16 = [(MessageViewStatusIndicatorManager *)self _accessibilityIdentifierForIndicatorOptions:v12];
        [v15 setAccessibilityIdentifier:v16];

        [v15 sizeToFit];
        [v15 setTintColor:v13];
        [v15 setTintAdjustmentMode:1];

        ++v11;
      }
      ++v10;
    }
    while (v10 != 8);
    self->_statusIndicatorImageViewsSize = v11;
  }
}

- (NSArray)statusIndicatorImageViews
{
  return (NSArray *)-[NSMutableArray subarrayWithRange:](self->_statusIndicatorImageViews, "subarrayWithRange:", 0, self->_statusIndicatorImageViewsSize);
}

- (id)_accessibilityIdentifierForIndicatorOptions:(unint64_t)a3
{
  if (a3)
  {
    v4 = (id *)&MSAccessibilityIdentifierMailMessageViewUnread;
    goto LABEL_19;
  }
  if ((a3 & 2) != 0)
  {
    v4 = (id *)&MSAccessibilityIdentifierMailMessageViewVIP;
    goto LABEL_19;
  }
  if ((a3 & 4) != 0)
  {
    v4 = (id *)&MSAccessibilityIdentifierMailMessageViewFlagged;
    goto LABEL_19;
  }
  if ((a3 & 8) != 0)
  {
    v4 = (id *)&MSAccessibilityIdentifierMailMessageViewReplied;
    goto LABEL_19;
  }
  if ((a3 & 0x10) != 0)
  {
    v4 = (id *)&MSAccessibilityIdentifierMailMessageViewForwarded;
    goto LABEL_19;
  }
  if ((a3 & 0x20) != 0)
  {
    v4 = (id *)&MSAccessibilityIdentifierMailMessageViewAttachment;
    goto LABEL_19;
  }
  if ((a3 & 0x40) != 0)
  {
    v4 = (id *)&MSAccessibilityIdentifierMailMessageViewNotify;
    goto LABEL_19;
  }
  if ((a3 & 0x100) != 0)
  {
    v4 = (id *)&MSAccessibilityIdentifierMailMessageViewBlockedSender;
    goto LABEL_19;
  }
  if ((a3 & 7) != 0)
  {
    v4 = (id *)&MSAccessibilityIdentifierMailMessageViewUnreadVIPFlagged;
    goto LABEL_19;
  }
  if ((a3 & 0x18) != 0)
  {
    v4 = (id *)&MSAccessibilityIdentifierMailMessageViewRepliedForwarded;
LABEL_19:
    id v5 = *v4;
    return v5;
  }
  id v5 = 0;
  return v5;
}

- (void).cxx_destruct
{
}

@end