@interface TIErrorGenerator
+ (TIErrorGenerator)errorGeneratorWithAttributes:(id)a3;
- (CGPoint)globalBias;
- (CGPoint)persistentBiasForBottomRow:(CGRect)a3;
- (CGPoint)persistentBiasForKeyString:(id)a3 rect:(CGRect)a4;
- (CGPoint)persistentBiasForSpaceBarRect:(CGRect)a3;
- (CGPoint)randomErrorForKeyString:(id)a3 rect:(CGRect)a4;
- (CGPoint)randomPointInDistribution;
- (CGPoint)uniformRandomPointInRect:(CGRect)a3;
- (TIErrorGenerator)init;
- (TIErrorGenerator)initWithAttributes:(id)a3;
- (TIKeyboardInfoDelegate)keyboardInfoDelgate;
- (double)probTappingSpaceInsteadOfBottomRow;
- (double)probTappingSpaceReplacedByBottomRow;
- (double)spaceVerticalBias;
- (double)uniformRandomNumber;
- (id)errorForKeyString:(id)a3 rect:(CGRect)a4;
- (int64_t)spaceHorizontalErrorMode;
- (int64_t)spacingErrorMaxCount;
- (int64_t)spacingErrorsApplied;
- (void)dealloc;
- (void)reset;
- (void)setKeyboardInfoDelgate:(id)a3;
- (void)setProbTappingSpaceInsteadOfBottomRow:(double)a3;
- (void)setProbTappingSpaceReplacedByBottomRow:(double)a3;
- (void)setRandomNumberSeed:(unsigned int)a3;
- (void)setSpaceHorizontalErrorMode:(int64_t)a3;
- (void)setSpaceVerticalBias:(double)a3;
- (void)setSpacingErrorMaxCount:(int64_t)a3;
- (void)setSpacingErrorsApplied:(int64_t)a3;
@end

@implementation TIErrorGenerator

- (void).cxx_destruct
{
}

- (void)setSpacingErrorMaxCount:(int64_t)a3
{
  self->_spacingErrorMaxCount = a3;
}

- (int64_t)spacingErrorMaxCount
{
  return self->_spacingErrorMaxCount;
}

- (void)setSpacingErrorsApplied:(int64_t)a3
{
  self->_spacingErrorsApplied = a3;
}

- (int64_t)spacingErrorsApplied
{
  return self->_spacingErrorsApplied;
}

- (void)setKeyboardInfoDelgate:(id)a3
{
}

- (TIKeyboardInfoDelegate)keyboardInfoDelgate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardInfoDelgate);
  return (TIKeyboardInfoDelegate *)WeakRetained;
}

- (void)setProbTappingSpaceReplacedByBottomRow:(double)a3
{
  self->_probTappingSpaceReplacedByBottomRow = a3;
}

- (double)probTappingSpaceReplacedByBottomRow
{
  return self->_probTappingSpaceReplacedByBottomRow;
}

- (void)setProbTappingSpaceInsteadOfBottomRow:(double)a3
{
  self->_probTappingSpaceInsteadOfBottomRow = a3;
}

- (double)probTappingSpaceInsteadOfBottomRow
{
  return self->_probTappingSpaceInsteadOfBottomRow;
}

- (void)setSpaceVerticalBias:(double)a3
{
  self->_spaceVerticalBias = a3;
}

- (double)spaceVerticalBias
{
  return self->_spaceVerticalBias;
}

- (void)setSpaceHorizontalErrorMode:(int64_t)a3
{
  self->_spaceHorizontalErrorMode = a3;
}

- (int64_t)spaceHorizontalErrorMode
{
  return self->_spaceHorizontalErrorMode;
}

- (CGPoint)randomPointInDistribution
{
  [(TIErrorGenerator *)self uniformRandomNumber];
  double v4 = v3;
  [(TIErrorGenerator *)self uniformRandomNumber];
  double v6 = v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (id)errorForKeyString:(id)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v9 = (NSString *)a3;
  [(TIErrorGenerator *)self globalBias];
  double v11 = v10;
  double v13 = v12;
  if (_isNumberPunctationKey(v9))
  {
    float relErrorNumbersPunctuation = self->_relErrorNumbersPunctuation;
  }
  else
  {
    if (!_isControlKey(v9)) {
      goto LABEL_6;
    }
    float relErrorNumbersPunctuation = self->_relErrorControlKeys;
  }
  double v15 = relErrorNumbersPunctuation;
  double v11 = v11 * v15;
  double v13 = v13 * v15;
LABEL_6:
  -[TIErrorGenerator persistentBiasForKeyString:rect:](self, "persistentBiasForKeyString:rect:", v9, x, y, width, height);
  double v17 = v16;
  double v19 = v18;
  -[TIErrorGenerator randomErrorForKeyString:rect:](self, "randomErrorForKeyString:rect:", v9, x, y, width, height);
  double v21 = v20;
  double v23 = v22;
  if (_isNumberPunctationKey(v9))
  {
    float relErrorControlKeys = self->_relErrorNumbersPunctuation;
  }
  else
  {
    if (!_isControlKey(v9)) {
      goto LABEL_11;
    }
    float relErrorControlKeys = self->_relErrorControlKeys;
  }
  double v25 = relErrorControlKeys;
  double v21 = v21 * v25;
  double v23 = v23 * v25;
LABEL_11:
  v26 = +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", v11 + 0.0 + v17 + v21, v13 + 0.0 + v19 + v23);

  return v26;
}

- (CGPoint)randomErrorForKeyString:(id)a3 rect:(CGRect)a4
{
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)persistentBiasForKeyString:(id)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if ([v9 isEqualToString:@" "])
  {
    -[TIErrorGenerator persistentBiasForSpaceBarRect:](self, "persistentBiasForSpaceBarRect:", x, y, width, height);
  }
  else
  {
    double v12 = [(TIErrorGenerator *)self keyboardInfoDelgate];
    int v13 = [v12 isKeyStringAboveSpaceBar:v9];

    if (!v13)
    {
      double v14 = *MEMORY[0x263F00148];
      double v15 = *(double *)(MEMORY[0x263F00148] + 8);
      goto LABEL_7;
    }
    -[TIErrorGenerator persistentBiasForBottomRow:](self, "persistentBiasForBottomRow:", x, y, width, height);
  }
  double v14 = v10;
  double v15 = v11;
LABEL_7:

  double v16 = v14;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)globalBias
{
  double v2 = *MEMORY[0x263F00148];
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)persistentBiasForBottomRow:(CGRect)a3
{
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  double Height = CGRectGetHeight(a3);
  int64_t v7 = [(TIErrorGenerator *)self spacingErrorsApplied];
  if (v7 < [(TIErrorGenerator *)self spacingErrorMaxCount])
  {
    [(TIErrorGenerator *)self uniformRandomNumber];
    double v9 = v8;
    [(TIErrorGenerator *)self probTappingSpaceInsteadOfBottomRow];
    if (v9 < v10)
    {
      double v5 = v5 + Height;
      [(TIErrorGenerator *)self setSpacingErrorsApplied:[(TIErrorGenerator *)self spacingErrorsApplied] + 1];
    }
  }
  double v11 = v4;
  double v12 = v5;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)persistentBiasForSpaceBarRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  double v10 = CGRectGetHeight(a3);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v11 = CGRectGetWidth(v25) - v10;
  int64_t v12 = [(TIErrorGenerator *)self spaceHorizontalErrorMode];
  double v13 = v8 + v11 * -0.5;
  double v14 = v8 + v11 * 0.5;
  if (v12 != 2) {
    double v14 = v8;
  }
  if (v12 == 3) {
    double v15 = v8 + v11 * -0.5;
  }
  else {
    double v15 = v14;
  }
  [(TIErrorGenerator *)self spaceVerticalBias];
  double v17 = v9 - v10 * v16;
  int64_t v18 = [(TIErrorGenerator *)self spacingErrorsApplied];
  if (v18 < [(TIErrorGenerator *)self spacingErrorMaxCount])
  {
    [(TIErrorGenerator *)self uniformRandomNumber];
    double v20 = v19;
    [(TIErrorGenerator *)self probTappingSpaceReplacedByBottomRow];
    if (v20 < v21)
    {
      double v17 = v17 - v10;
      [(TIErrorGenerator *)self setSpacingErrorsApplied:[(TIErrorGenerator *)self spacingErrorsApplied] + 1];
    }
  }
  double v22 = v15;
  double v23 = v17;
  result.CGFloat y = v23;
  result.CGFloat x = v22;
  return result;
}

- (CGPoint)uniformRandomPointInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TIErrorGenerator *)self uniformRandomNumber];
  double v9 = x + v8 * width;
  [(TIErrorGenerator *)self uniformRandomNumber];
  double v11 = y + v10 * height;
  double v12 = v9;
  result.double y = v11;
  result.double x = v12;
  return result;
}

- (double)uniformRandomNumber
{
  m_generator = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)self->m_generator;
  m_distribution = (double *)self->m_distribution;
  double v4 = m_distribution[1] - *m_distribution;
  double v5 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(m_generator);
  return *m_distribution
       + v4
       * ((v5
         + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(m_generator)
         * 4294967300.0)
        * 5.42101086e-20);
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  unsigned int v3 = 257 * self->_RNGSeedSalt + a3;
  m_generator = self->m_generator;
  _DWORD *m_generator = v3;
  for (uint64_t i = 1; i != 624; ++i)
  {
    unsigned int v3 = i + 1812433253 * (v3 ^ (v3 >> 30));
    m_generator[i] = v3;
  }
  *((void *)m_generator + 312) = 0;
  [(TIErrorGenerator *)self reset];
}

- (void)reset
{
}

- (void)dealloc
{
  m_generator = self->m_generator;
  if (m_generator) {
    MEMORY[0x2455C26F0](m_generator, 0x1000C407BAC9B3ELL);
  }
  m_distribution = self->m_distribution;
  if (m_distribution) {
    MEMORY[0x2455C26F0](m_distribution, 0x1000C40451B5BE8);
  }
  v5.receiver = self;
  v5.super_class = (Class)TIErrorGenerator;
  [(TIErrorGenerator *)&v5 dealloc];
}

- (TIErrorGenerator)init
{
  return [(TIErrorGenerator *)self initWithAttributes:MEMORY[0x263EFFA78]];
}

- (TIErrorGenerator)initWithAttributes:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TIErrorGenerator;
  objc_super v5 = [(TIErrorGenerator *)&v25 init];
  if (v5)
  {
    double v6 = [v4 objectForKey:@"SPACE_HORIZONTAL_ERROR_BIAS"];
    int64_t v7 = v6;
    if (!v6) {
      double v6 = @"1";
    }
    v5->_spaceHorizontalErrorMode = [(__CFString *)v6 integerValue];

    double v8 = [v4 objectForKey:@"SPACE_VERTICAL_ERROR_BIAS"];
    double v9 = v8;
    if (!v8) {
      double v8 = @"0.0";
    }
    [(__CFString *)v8 floatValue];
    v5->_spaceVerticalBias = v10;

    double v11 = [v4 valueForKey:@"PROB_SPACE_REPLACED_BY_BOTTOM_ROW"];
    [v11 floatValue];
    v5->_probTappingSpaceReplacedByBottomRow = v12;

    double v13 = [v4 valueForKey:@"PROB_SPACE_INSTEAD_OF_BOTTOM_ROW"];
    [v13 floatValue];
    v5->_probTappingSpaceInsteadOfBottomRow = v14;

    double v15 = [v4 valueForKey:@"MAX_SPACE_ERRORS_PER_TEST"];
    v5->_spacingErrorMaxCount = (int)[v15 intValue];

    double v16 = [v4 valueForKey:@"REL_ERROR_NUMBERS_PUNCTATION"];
    double v17 = v16;
    if (!v16) {
      double v16 = &unk_26F2C9F70;
    }
    [v16 floatValue];
    v5->_float relErrorNumbersPunctuation = v18;

    double v19 = [v4 valueForKey:@"REL_ERROR_CONTROL_KEYS"];
    double v20 = v19;
    if (!v19) {
      double v19 = &unk_26F2C9F70;
    }
    [v19 floatValue];
    v5->_float relErrorControlKeys = v21;

    double v22 = [v4 valueForKey:@"RNG_SEED_SALT"];
    double v23 = v22;
    if (!v22) {
      double v22 = &unk_26F2C9F80;
    }
    v5->_RNGSeedSalt = [v22 integerValue];

    operator new();
  }

  return 0;
}

+ (TIErrorGenerator)errorGeneratorWithAttributes:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForKey:@"ERROR_GENERATOR"];
  objc_super v5 = NSClassFromString(v4);
  if (!v5) {
    objc_super v5 = (objc_class *)objc_opt_class();
  }
  double v6 = (void *)[[v5 alloc] initWithAttributes:v3];

  return (TIErrorGenerator *)v6;
}

@end