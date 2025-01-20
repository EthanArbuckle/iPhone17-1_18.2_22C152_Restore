@interface NCNotificationRequest(CarPlay)
- (id)carPlayAttributedMessage;
- (id)carPlayMessage;
- (id)carPlaySubTitle;
- (id)carPlayTitle;
@end

@implementation NCNotificationRequest(CarPlay)

- (id)carPlayTitle
{
  v2 = [a1 content];
  v3 = [v2 title];

  if (![v3 length])
  {
    v4 = [a1 content];
    v5 = [v4 customHeader];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v8 = [a1 content];
      id v7 = [v8 defaultHeader];

      v3 = v8;
    }

    v3 = v7;
  }

  return v3;
}

- (id)carPlaySubTitle
{
  v2 = [a1 content];
  v3 = [v2 subtitle];

  if (![v3 length])
  {
    v4 = [a1 content];
    v5 = [v4 title];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = [a1 content];
      v8 = [v7 customHeader];
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        v11 = [a1 content];
        id v10 = [v11 defaultHeader];

        v3 = v11;
      }

      v3 = v10;
    }
  }

  return v3;
}

- (id)carPlayMessage
{
  v1 = [a1 carPlayAttributedMessage];
  v2 = [v1 string];

  return v2;
}

- (id)carPlayAttributedMessage
{
  v1 = [a1 content];
  v2 = [v1 attributedMessage];

  return v2;
}

@end