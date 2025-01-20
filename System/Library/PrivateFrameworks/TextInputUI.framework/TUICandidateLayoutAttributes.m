@interface TUICandidateLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (TUICandidateLayoutAttributes)init;
- (double)contentAlpha;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)candidateNumber;
- (unint64_t)row;
- (void)setCandidateNumber:(unint64_t)a3;
- (void)setContentAlpha:(double)a3;
- (void)setRow:(unint64_t)a3;
@end

@implementation TUICandidateLayoutAttributes

- (void)setRow:(unint64_t)a3
{
  self->_row = a3;
}

- (unint64_t)row
{
  return self->_row;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)setCandidateNumber:(unint64_t)a3
{
  self->_candidateNumber = a3;
}

- (unint64_t)candidateNumber
{
  return self->_candidateNumber;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUICandidateLayoutAttributes;
  if ([(UICollectionViewLayoutAttributes *)&v12 isEqual:v4]
    && (unint64_t v5 = [(TUICandidateLayoutAttributes *)self candidateNumber],
        v5 == [v4 candidateNumber])
    && ([(TUICandidateLayoutAttributes *)self contentAlpha],
        double v7 = v6,
        [v4 contentAlpha],
        v7 == v8))
  {
    unint64_t v11 = [(TUICandidateLayoutAttributes *)self row];
    BOOL v9 = v11 == [v4 row];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUICandidateLayoutAttributes;
  id result = [(UICollectionViewLayoutAttributes *)&v5 copyWithZone:a3];
  *((void *)result + 44) = self->_candidateNumber;
  *((void *)result + 45) = *(void *)&self->_contentAlpha;
  *((void *)result + 46) = self->_row;
  return result;
}

- (TUICandidateLayoutAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUICandidateLayoutAttributes;
  id result = [(UICollectionViewLayoutAttributes *)&v3 init];
  if (result) {
    result->_contentAlpha = 1.0;
  }
  return result;
}

@end