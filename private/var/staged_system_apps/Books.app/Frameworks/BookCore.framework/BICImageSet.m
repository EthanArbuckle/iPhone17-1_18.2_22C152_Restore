@interface BICImageSet
+ (id)primaryEntryFromEntries:(id)a3;
- (id)imageColor;
- (id)primaryEntry;
@end

@implementation BICImageSet

- (id)primaryEntry
{
  v2 = [(BICImageSet *)self imageEntries];
  v3 = +[BICImageSet primaryEntryFromEntries:v2];

  return v3;
}

+ (id)primaryEntryFromEntries:(id)a3
{
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v4)
  {
    v8 = 0;
    goto LABEL_17;
  }
  id v5 = v4;
  unsigned __int16 v6 = 0;
  signed __int16 v7 = 0;
  v8 = 0;
  uint64_t v9 = *(void *)v15;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v3);
      }
      v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if ([v11 potentialPrimary])
      {
        if ([v11 quality] > v6)
        {
          id v12 = v11;

          signed __int16 v7 = (unsigned __int16)[v12 level];
          unsigned __int16 v6 = (unsigned __int16)[v12 quality];
LABEL_9:
          v8 = v12;
          continue;
        }
        if ([v11 quality] == v6 && (int)objc_msgSend(v11, "level") > v7)
        {
          id v12 = v11;

          signed __int16 v7 = (unsigned __int16)[v12 level];
          goto LABEL_9;
        }
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v5);
LABEL_17:

  return v8;
}

- (id)imageColor
{
  if ([(BICImageSet *)self imageColorARGBHex] == (id)0xFFFFFF)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = +[UIColor bc_colorWithARGBHexValue:[(BICImageSet *)self imageColorARGBHex]];
  }

  return v3;
}

@end