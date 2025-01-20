@interface BKFlowingBookPlistConfigurationEnvironment
- (BKFlowingBookFontSizeConfiguration)fontSizeConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFlowingBookPlistConfigurationEnvironment:(id)a3;
- (BOOL)scroll;
- (double)fontSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForKey:(id)a3;
- (int64_t)_semanticFontSize;
- (void)setFontSize:(double)a3;
- (void)setFontSizeConfiguration:(id)a3;
- (void)setLargeSizeFactor:(double)a3;
- (void)setScroll:(BOOL)a3;
@end

@implementation BKFlowingBookPlistConfigurationEnvironment

- (void)setLargeSizeFactor:(double)a3
{
  id v4 = [(BKFlowingBookPlistConfigurationEnvironment *)self fontSizeConfiguration];
  [v4 setLargeSizeFactor:a3];
}

- (int64_t)_semanticFontSize
{
  [(BKFlowingBookPlistConfigurationEnvironment *)self fontSize];
  if (v3 == 0.0) {
    return 0;
  }
  [(BKFlowingBookPlistConfigurationEnvironment *)self fontSize];
  double v5 = v4;
  v6 = [(BKFlowingBookPlistConfigurationEnvironment *)self fontSizeConfiguration];
  [v6 smallSize];
  double v8 = v7;

  if (v5 < v8) {
    return 0;
  }
  [(BKFlowingBookPlistConfigurationEnvironment *)self fontSize];
  double v11 = v10;
  v12 = [(BKFlowingBookPlistConfigurationEnvironment *)self fontSizeConfiguration];
  [v12 mediumSize];
  double v14 = v13;

  if (v11 < v14) {
    return 1;
  }
  [(BKFlowingBookPlistConfigurationEnvironment *)self fontSize];
  double v16 = v15;
  v17 = [(BKFlowingBookPlistConfigurationEnvironment *)self fontSizeConfiguration];
  [v17 largeSize];
  double v19 = v18;

  if (v16 >= v19) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"scroll"])
  {
    uint64_t v5 = +[NSNumber numberWithBool:[(BKFlowingBookPlistConfigurationEnvironment *)self scroll]];
LABEL_7:
    double v7 = (__CFString *)v5;
    goto LABEL_8;
  }
  if (![v4 isEqualToString:@"fontsize"])
  {
    v9.receiver = self;
    v9.super_class = (Class)BKFlowingBookPlistConfigurationEnvironment;
    uint64_t v5 = [(BKFlowingBookPlistConfigurationEnvironment *)&v9 valueForKey:v4];
    goto LABEL_7;
  }
  unint64_t v6 = [(BKFlowingBookPlistConfigurationEnvironment *)self _semanticFontSize];
  if (v6 > 3) {
    double v7 = 0;
  }
  else {
    double v7 = off_1DBB28[v6];
  }
LABEL_8:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKFlowingBookPlistConfigurationEnvironment;
  id v4 = [(BKFlowingBookPlistConfigurationEnvironment *)&v6 copyWithZone:a3];
  [v4 setScroll:[self scroll]];
  [(BKFlowingBookPlistConfigurationEnvironment *)self fontSize];
  [v4 setFontSize:];
  return v4;
}

- (BOOL)isEqualToFlowingBookPlistConfigurationEnvironment:(id)a3
{
  id v4 = (id *)a3;
  unsigned int v5 = [(BKFlowingBookPlistConfigurationEnvironment *)self scroll];
  if (v5 == [v4 scroll]
    && ([(BKFlowingBookPlistConfigurationEnvironment *)self fontSize],
        double v7 = v6,
        [v4 fontSize],
        v7 == v8))
  {
    p_fontSizeConfiguration = &self->_fontSizeConfiguration;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_fontSizeConfiguration);
    id v11 = objc_loadWeakRetained(v4 + 3);
    if (WeakRetained == v11)
    {
      unsigned __int8 v14 = 1;
    }
    else
    {
      id v12 = objc_loadWeakRetained((id *)p_fontSizeConfiguration);
      id v13 = objc_loadWeakRetained(v4 + 3);
      unsigned __int8 v14 = [v12 isEqual:v13];
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKFlowingBookPlistConfigurationEnvironment *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v7.receiver = self,
          v7.super_class = (Class)BKFlowingBookPlistConfigurationEnvironment,
          [(BKFlowingBookPlistConfigurationEnvironment *)&v7 isEqual:v4]))
    {
      BOOL v5 = [(BKFlowingBookPlistConfigurationEnvironment *)self isEqualToFlowingBookPlistConfigurationEnvironment:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)scroll
{
  return self->_scroll;
}

- (void)setScroll:(BOOL)a3
{
  self->_scroll = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (BKFlowingBookFontSizeConfiguration)fontSizeConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fontSizeConfiguration);

  return (BKFlowingBookFontSizeConfiguration *)WeakRetained;
}

- (void)setFontSizeConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end