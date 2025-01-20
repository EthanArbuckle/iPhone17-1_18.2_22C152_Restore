@interface FCCardStyle
+ (id)styleWithConfigDict:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FCCardStyle)initWithTitleForegroundColor:(id)a3 eyebrowForegroundColor:(id)a4 cardBackgroundColor:(id)a5 cardForegroundColor:(id)a6 sauceGradient:(id)a7 ctaBackgroundColor:(id)a8 ctaForegroundColor:(id)a9;
- (FCColor)cardBackgroundColor;
- (FCColor)cardForegroundColor;
- (FCColor)ctaBackgroundColor;
- (FCColor)ctaForegroundColor;
- (FCColor)eyebrowForegroundColor;
- (FCColor)titleForegroundColor;
- (FCColorGradient)sauceGradient;
- (unint64_t)hash;
- (void)setCardBackgroundColor:(id)a3;
- (void)setCardForegroundColor:(id)a3;
- (void)setCtaBackgroundColor:(id)a3;
- (void)setCtaForegroundColor:(id)a3;
- (void)setEyebrowForegroundColor:(id)a3;
- (void)setSauceGradient:(id)a3;
- (void)setTitleForegroundColor:(id)a3;
@end

@implementation FCCardStyle

- (FCCardStyle)initWithTitleForegroundColor:(id)a3 eyebrowForegroundColor:(id)a4 cardBackgroundColor:(id)a5 cardForegroundColor:(id)a6 sauceGradient:(id)a7 ctaBackgroundColor:(id)a8 ctaForegroundColor:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FCCardStyle;
  v18 = [(FCCardStyle *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_titleForegroundColor, a3);
    objc_storeStrong((id *)&v19->_eyebrowForegroundColor, a4);
    objc_storeStrong((id *)&v19->_cardBackgroundColor, a5);
    objc_storeStrong((id *)&v19->_cardForegroundColor, a6);
    objc_storeStrong((id *)&v19->_sauceGradient, a7);
    objc_storeStrong((id *)&v19->_ctaBackgroundColor, a8);
    objc_storeStrong((id *)&v19->_ctaForegroundColor, a9);
  }

  return v19;
}

+ (id)styleWithConfigDict:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"titleForegroundColor"];
  v5 = +[FCColor nullableColorWithHexString:v4];

  v6 = [v3 objectForKeyedSubscript:@"eyebrowForegroundColor"];
  v7 = +[FCColor nullableColorWithHexString:v6];

  v8 = [v3 objectForKeyedSubscript:@"cardBackgroundColor"];
  v9 = +[FCColor nullableColorWithHexString:v8];

  v10 = [v3 objectForKeyedSubscript:@"cardForegroundColor"];
  v11 = +[FCColor nullableColorWithHexString:v10];

  v12 = [v3 objectForKeyedSubscript:@"sauceColorGradient"];
  if (v12)
  {
    v13 = +[FCColorGradient colorGradientWithConfigDict:v12];
  }
  else
  {
    v13 = 0;
  }
  v14 = [v3 objectForKeyedSubscript:@"ctaBackgroundColor"];
  v15 = +[FCColor nullableColorWithHexString:v14];

  id v16 = [v3 objectForKeyedSubscript:@"ctaForegroundColor"];
  id v17 = +[FCColor nullableColorWithHexString:v16];

  v18 = [[FCCardStyle alloc] initWithTitleForegroundColor:v5 eyebrowForegroundColor:v7 cardBackgroundColor:v9 cardForegroundColor:v11 sauceGradient:v13 ctaBackgroundColor:v15 ctaForegroundColor:v17];
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FCCardStyle *)a3;
  if (self == v4)
  {
    char v26 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1E4FBA8A8];
      v7 = [(FCCardStyle *)self titleForegroundColor];
      v8 = [(FCCardStyle *)v5 titleForegroundColor];
      if (objc_msgSend(v6, "nf_object:isEqualToObject:", v7, v8))
      {
        v9 = (void *)MEMORY[0x1E4FBA8A8];
        v10 = [(FCCardStyle *)self eyebrowForegroundColor];
        v11 = [(FCCardStyle *)v5 eyebrowForegroundColor];
        if (objc_msgSend(v9, "nf_object:isEqualToObject:", v10, v11))
        {
          v12 = (void *)MEMORY[0x1E4FBA8A8];
          v13 = [(FCCardStyle *)self cardBackgroundColor];
          uint64_t v37 = [(FCCardStyle *)v5 cardBackgroundColor];
          v38 = v13;
          if (objc_msgSend(v12, "nf_object:isEqualToObject:", v13))
          {
            v14 = (void *)MEMORY[0x1E4FBA8A8];
            uint64_t v15 = [(FCCardStyle *)self cardForegroundColor];
            v36 = [(FCCardStyle *)v5 cardForegroundColor];
            if (objc_msgSend(v14, "nf_object:isEqualToObject:", v15))
            {
              v34 = (void *)MEMORY[0x1E4FBA8A8];
              uint64_t v16 = [(FCCardStyle *)self sauceGradient];
              uint64_t v17 = [(FCCardStyle *)v5 sauceGradient];
              v18 = v34;
              v33 = (void *)v17;
              v35 = (void *)v16;
              int v19 = objc_msgSend(v18, "nf_object:isEqualToObject:", v16);
              v20 = (void *)v15;
              if (v19)
              {
                v31 = (void *)MEMORY[0x1E4FBA8A8];
                uint64_t v21 = [(FCCardStyle *)self ctaBackgroundColor];
                uint64_t v22 = [(FCCardStyle *)v5 ctaBackgroundColor];
                id v23 = v31;
                v30 = (void *)v22;
                v32 = (void *)v21;
                if (objc_msgSend(v23, "nf_object:isEqualToObject:", v21))
                {
                  v29 = (void *)MEMORY[0x1E4FBA8A8];
                  id v24 = [(FCCardStyle *)self ctaForegroundColor];
                  id v25 = [(FCCardStyle *)v5 ctaForegroundColor];
                  char v26 = objc_msgSend(v29, "nf_object:isEqualToObject:", v24, v25);
                }
                else
                {
                  char v26 = 0;
                }
                v27 = (void *)v37;
                v13 = v38;
              }
              else
              {
                char v26 = 0;
                v27 = (void *)v37;
                v13 = v38;
              }
            }
            else
            {
              v20 = (void *)v15;
              char v26 = 0;
              v27 = (void *)v37;
              v13 = v38;
            }
          }
          else
          {
            char v26 = 0;
            v27 = (void *)v37;
          }
        }
        else
        {
          char v26 = 0;
        }
      }
      else
      {
        char v26 = 0;
      }
    }
    else
    {
      char v26 = 0;
    }
  }

  return v26;
}

- (unint64_t)hash
{
  id v3 = [(FCCardStyle *)self titleForegroundColor];
  uint64_t v4 = [v3 hash];
  v5 = [(FCCardStyle *)self ctaForegroundColor];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(FCCardStyle *)self cardBackgroundColor];
  uint64_t v8 = [v7 hash];
  v9 = [(FCCardStyle *)self cardForegroundColor];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(FCCardStyle *)self eyebrowForegroundColor];
  uint64_t v12 = [v11 hash];
  v13 = [(FCCardStyle *)self sauceGradient];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = [(FCCardStyle *)self ctaBackgroundColor];
  unint64_t v16 = v10 ^ v14 ^ [v15 hash];

  return v16;
}

- (FCColor)titleForegroundColor
{
  return self->_titleForegroundColor;
}

- (void)setTitleForegroundColor:(id)a3
{
}

- (FCColor)eyebrowForegroundColor
{
  return self->_eyebrowForegroundColor;
}

- (void)setEyebrowForegroundColor:(id)a3
{
}

- (FCColor)cardBackgroundColor
{
  return self->_cardBackgroundColor;
}

- (void)setCardBackgroundColor:(id)a3
{
}

- (FCColor)cardForegroundColor
{
  return self->_cardForegroundColor;
}

- (void)setCardForegroundColor:(id)a3
{
}

- (FCColorGradient)sauceGradient
{
  return self->_sauceGradient;
}

- (void)setSauceGradient:(id)a3
{
}

- (FCColor)ctaBackgroundColor
{
  return self->_ctaBackgroundColor;
}

- (void)setCtaBackgroundColor:(id)a3
{
}

- (FCColor)ctaForegroundColor
{
  return self->_ctaForegroundColor;
}

- (void)setCtaForegroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctaForegroundColor, 0);
  objc_storeStrong((id *)&self->_ctaBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sauceGradient, 0);
  objc_storeStrong((id *)&self->_cardForegroundColor, 0);
  objc_storeStrong((id *)&self->_cardBackgroundColor, 0);
  objc_storeStrong((id *)&self->_eyebrowForegroundColor, 0);
  objc_storeStrong((id *)&self->_titleForegroundColor, 0);
}

@end