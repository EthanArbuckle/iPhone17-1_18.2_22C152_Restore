@interface CarFocusOrderSequence
+ (id)sequenceWithItems:(id)a3 options:(unint64_t)a4;
- (BOOL)flipForRHD;
- (BOOL)isLooping;
- (NSArray)items;
- (unint64_t)options;
- (void)setItems:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation CarFocusOrderSequence

+ (id)sequenceWithItems:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(CarFocusOrderSequence);
  [(CarFocusOrderSequence *)v6 setItems:v5];

  [(CarFocusOrderSequence *)v6 setOptions:a4];

  return v6;
}

- (BOOL)isLooping
{
  return ([(CarFocusOrderSequence *)self options] >> 3) & 1;
}

- (BOOL)flipForRHD
{
  if (([(CarFocusOrderSequence *)self options] & 4) == 0) {
    return 0;
  }
  v3 = +[MapsExternalDevice sharedInstance];
  unsigned __int8 v4 = [v3 rightHandDrive];

  return v4;
}

- (NSArray)items
{
  unint64_t v3 = [(CarFocusOrderSequence *)self options];
  if (v3) {
    char v4 = v3;
  }
  else {
    char v4 = 3;
  }
  id v5 = +[MapsExternalDevice sharedInstance];
  unsigned int v6 = [v5 rightHandDrive];

  if (v6)
  {
    if ((v4 & 2) == 0)
    {
      if ((v4 & 4) != 0)
      {
        v7 = [(NSArray *)self->_items reverseObjectEnumerator];
        v8 = [v7 allObjects];

        goto LABEL_11;
      }
      goto LABEL_9;
    }
  }
  else if ((v4 & 1) == 0)
  {
LABEL_9:
    v8 = (NSArray *)&__NSArray0__struct;
    goto LABEL_11;
  }
  v8 = self->_items;
LABEL_11:

  return v8;
}

- (void)setItems:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
}

@end