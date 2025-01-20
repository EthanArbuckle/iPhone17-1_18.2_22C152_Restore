@interface SVXUserFeedbackAudioContent
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSURL)itemURL;
- (SVXUserFeedbackAudioContent)initWithCoder:(id)a3;
- (SVXUserFeedbackAudioContent)initWithItemURL:(id)a3 numberOfLoops:(unint64_t)a4 fadeInDuration:(double)a5 fadeOutDuration:(double)a6;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unint64_t)numberOfLoops;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXUserFeedbackAudioContent

- (void).cxx_destruct
{
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (unint64_t)numberOfLoops
{
  return self->_numberOfLoops;
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)encodeWithCoder:(id)a3
{
  itemURL = self->_itemURL;
  id v5 = a3;
  [v5 encodeObject:itemURL forKey:@"SVXUserFeedbackAudioContent::itemURL"];
  v6 = [NSNumber numberWithUnsignedInteger:self->_numberOfLoops];
  [v5 encodeObject:v6 forKey:@"SVXUserFeedbackAudioContent::numberOfLoops"];

  v7 = [NSNumber numberWithDouble:self->_fadeInDuration];
  [v5 encodeObject:v7 forKey:@"SVXUserFeedbackAudioContent::fadeInDuration"];

  id v8 = [NSNumber numberWithDouble:self->_fadeOutDuration];
  [v5 encodeObject:v8 forKey:@"SVXUserFeedbackAudioContent::fadeOutDuration"];
}

- (SVXUserFeedbackAudioContent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackAudioContent::itemURL"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackAudioContent::numberOfLoops"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackAudioContent::fadeInDuration"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackAudioContent::fadeOutDuration"];

  [v11 doubleValue];
  double v13 = v12;

  v14 = [(SVXUserFeedbackAudioContent *)self initWithItemURL:v5 numberOfLoops:v7 fadeInDuration:v10 fadeOutDuration:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXUserFeedbackAudioContent *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t numberOfLoops = self->_numberOfLoops;
      if (numberOfLoops == [(SVXUserFeedbackAudioContent *)v5 numberOfLoops]
        && (double fadeInDuration = self->_fadeInDuration,
            [(SVXUserFeedbackAudioContent *)v5 fadeInDuration],
            fadeInDuration == v8)
        && (double fadeOutDuration = self->_fadeOutDuration,
            [(SVXUserFeedbackAudioContent *)v5 fadeOutDuration],
            fadeOutDuration == v10))
      {
        double v13 = [(SVXUserFeedbackAudioContent *)v5 itemURL];
        itemURL = self->_itemURL;
        BOOL v11 = itemURL == v13 || [(NSURL *)itemURL isEqual:v13];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_itemURL hash];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_numberOfLoops];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [NSNumber numberWithDouble:self->_fadeInDuration];
  uint64_t v7 = [v6 hash];
  double v8 = [NSNumber numberWithDouble:self->_fadeOutDuration];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SVXUserFeedbackAudioContent;
  uint64_t v5 = [(SVXUserFeedbackAudioContent *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {itemURL = %@, unint64_t numberOfLoops = %llu, fadeInDuration = %f, fadeOutDuration = %f}", v5, self->_itemURL, self->_numberOfLoops, *(void *)&self->_fadeInDuration, *(void *)&self->_fadeOutDuration];

  return v6;
}

- (id)description
{
  return [(SVXUserFeedbackAudioContent *)self _descriptionWithIndent:0];
}

- (SVXUserFeedbackAudioContent)initWithItemURL:(id)a3 numberOfLoops:(unint64_t)a4 fadeInDuration:(double)a5 fadeOutDuration:(double)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SVXUserFeedbackAudioContent;
  BOOL v11 = [(SVXUserFeedbackAudioContent *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    itemURL = v11->_itemURL;
    v11->_itemURL = (NSURL *)v12;

    v11->_unint64_t numberOfLoops = a4;
    v11->_double fadeInDuration = a5;
    v11->_double fadeOutDuration = a6;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXUserFeedbackAudioContentMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SVXUserFeedbackAudioContentMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    v6 = [(_SVXUserFeedbackAudioContentMutation *)v5 generate];
  }
  else
  {
    v6 = (void *)[(SVXUserFeedbackAudioContent *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  uint64_t v3 = (void (**)(id, _SVXUserFeedbackAudioContentMutation *))a3;
  id v4 = objc_alloc_init(_SVXUserFeedbackAudioContentMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  uint64_t v5 = [(_SVXUserFeedbackAudioContentMutation *)v4 generate];

  return v5;
}

@end