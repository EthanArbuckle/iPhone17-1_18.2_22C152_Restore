@interface _SVXUserFeedbackAudioContentMutation
- (_SVXUserFeedbackAudioContentMutation)init;
- (_SVXUserFeedbackAudioContentMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setItemURL:(id)a3;
- (void)setNumberOfLoops:(unint64_t)a3;
@end

@implementation _SVXUserFeedbackAudioContentMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemURL, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SVXUserFeedbackAudioContent alloc] initWithItemURL:self->_itemURL numberOfLoops:self->_numberOfLoops fadeInDuration:self->_fadeInDuration fadeOutDuration:self->_fadeOutDuration];
    goto LABEL_5;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 1) == 0)
  {
    v4 = (SVXUserFeedbackAudioContent *)[(SVXUserFeedbackAudioContent *)baseModel copy];
LABEL_5:
    v5 = v4;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v6 = self->_itemURL;
  }
  else
  {
    v6 = [(SVXUserFeedbackAudioContent *)baseModel itemURL];
  }
  v7 = v6;
  char mutationFlags = (char)self->_mutationFlags;
  if ((mutationFlags & 4) == 0)
  {
    unint64_t numberOfLoops = [(SVXUserFeedbackAudioContent *)self->_baseModel numberOfLoops];
    char mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 8) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    [(SVXUserFeedbackAudioContent *)self->_baseModel fadeInDuration];
    double fadeInDuration = v12;
    if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    [(SVXUserFeedbackAudioContent *)self->_baseModel fadeOutDuration];
    double fadeOutDuration = v13;
    goto LABEL_16;
  }
  unint64_t numberOfLoops = self->_numberOfLoops;
  if ((*(unsigned char *)&self->_mutationFlags & 8) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  double fadeInDuration = self->_fadeInDuration;
  if ((mutationFlags & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  double fadeOutDuration = self->_fadeOutDuration;
LABEL_16:
  v5 = [[SVXUserFeedbackAudioContent alloc] initWithItemURL:v7 numberOfLoops:numberOfLoops fadeInDuration:fadeInDuration fadeOutDuration:fadeOutDuration];

LABEL_17:

  return v5;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_double fadeOutDuration = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (void)setFadeInDuration:(double)a3
{
  self->_double fadeInDuration = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setNumberOfLoops:(unint64_t)a3
{
  self->_unint64_t numberOfLoops = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setItemURL:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXUserFeedbackAudioContentMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXUserFeedbackAudioContentMutation;
  v6 = [(_SVXUserFeedbackAudioContentMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXUserFeedbackAudioContentMutation)init
{
  return [(_SVXUserFeedbackAudioContentMutation *)self initWithBaseModel:0];
}

@end