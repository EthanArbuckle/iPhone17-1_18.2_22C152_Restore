@interface BICDescribedImageWithScore
- (BICDescribedImage)image;
- (int64_t)compare:(id)a3;
- (unint64_t)score;
- (void)setImage:(id)a3;
- (void)setScore:(unint64_t)a3;
@end

@implementation BICDescribedImageWithScore

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BICDescribedImageWithScore *)self score];
  id v6 = [v4 score];

  if (v5 < (unint64_t)v6) {
    return -1;
  }
  else {
    return v5 != (void)v6;
  }
}

- (BICDescribedImage)image
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_image);

  return (BICDescribedImage *)WeakRetained;
}

- (void)setImage:(id)a3
{
}

- (unint64_t)score
{
  return self->_score;
}

- (void)setScore:(unint64_t)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
}

@end