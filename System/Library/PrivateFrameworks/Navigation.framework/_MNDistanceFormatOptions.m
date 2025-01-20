@interface _MNDistanceFormatOptions
- (BOOL)abbreviateUnits;
- (BOOL)isEqual:(id)a3;
- (BOOL)metric;
- (BOOL)spoken;
- (BOOL)yards;
- (NSLocale)locale;
- (NSUnitLength)unitLength;
- (int64_t)rounding;
- (unint64_t)hash;
- (unint64_t)maximumFractionDigits;
- (unint64_t)minimumFractionDigits;
- (void)setAbbreviateUnits:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setMaximumFractionDigits:(unint64_t)a3;
- (void)setMetric:(BOOL)a3;
- (void)setMinimumFractionDigits:(unint64_t)a3;
- (void)setRounding:(int64_t)a3;
- (void)setSpoken:(BOOL)a3;
- (void)setUnitLength:(id)a3;
- (void)setYards:(BOOL)a3;
@end

@implementation _MNDistanceFormatOptions

- (void)setMinimumFractionDigits:(unint64_t)a3
{
  self->_minimumFractionDigits = a3;
}

- (void)setMaximumFractionDigits:(unint64_t)a3
{
  self->_maximumFractionDigits = a3;
}

- (void)setYards:(BOOL)a3
{
  self->_yards = a3;
}

- (void)setSpoken:(BOOL)a3
{
  self->_spoken = a3;
}

- (void)setRounding:(int64_t)a3
{
  self->_rounding = a3;
}

- (void)setMetric:(BOOL)a3
{
  self->_metric = a3;
}

- (void)setAbbreviateUnits:(BOOL)a3
{
  self->_abbreviateUnits = a3;
}

- (int64_t)rounding
{
  return self->_rounding;
}

- (unint64_t)minimumFractionDigits
{
  return self->_minimumFractionDigits;
}

- (unint64_t)maximumFractionDigits
{
  return self->_maximumFractionDigits;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MNDistanceFormatOptions *)self minimumFractionDigits];
  unint64_t v4 = [(_MNDistanceFormatOptions *)self maximumFractionDigits] ^ v3;
  unint64_t v5 = v4 ^ [(_MNDistanceFormatOptions *)self metric];
  uint64_t v6 = [(_MNDistanceFormatOptions *)self yards];
  unint64_t v7 = v5 ^ v6 ^ [(_MNDistanceFormatOptions *)self abbreviateUnits];
  uint64_t v8 = [(_MNDistanceFormatOptions *)self spoken];
  int64_t v9 = v8 ^ [(_MNDistanceFormatOptions *)self rounding];
  v10 = [(_MNDistanceFormatOptions *)self unitLength];
  uint64_t v11 = v7 ^ v9 ^ [v10 hash];
  v12 = [(_MNDistanceFormatOptions *)self locale];
  unint64_t v13 = v11 ^ [v12 hash];

  return v13;
}

- (BOOL)spoken
{
  return self->_spoken;
}

- (BOOL)yards
{
  return self->_yards;
}

- (NSUnitLength)unitLength
{
  return self->_unitLength;
}

- (BOOL)metric
{
  return self->_metric;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (BOOL)abbreviateUnits
{
  return self->_abbreviateUnits;
}

- (void)setUnitLength:(id)a3
{
}

- (void)setLocale:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    unint64_t v6 = [(_MNDistanceFormatOptions *)self minimumFractionDigits];
    if (v6 == [v5 minimumFractionDigits]
      && (unint64_t v7 = [(_MNDistanceFormatOptions *)self maximumFractionDigits],
          v7 == [v5 maximumFractionDigits])
      && (int v8 = -[_MNDistanceFormatOptions metric](self, "metric"), v8 == [v5 metric])
      && (int v9 = -[_MNDistanceFormatOptions yards](self, "yards"), v9 == [v5 yards])
      && (int v10 = [(_MNDistanceFormatOptions *)self abbreviateUnits],
          v10 == [v5 abbreviateUnits])
      && (int v11 = -[_MNDistanceFormatOptions spoken](self, "spoken"), v11 == [v5 spoken])
      && (int64_t v12 = -[_MNDistanceFormatOptions rounding](self, "rounding"), v12 == [v5 rounding]))
    {
      unint64_t v13 = [(_MNDistanceFormatOptions *)self unitLength];
      v14 = [v5 unitLength];
      if ([v13 isEqual:v14])
      {
        v15 = [(_MNDistanceFormatOptions *)self locale];
        v16 = [v5 locale];
        char v17 = [v15 isEqual:v16];
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_unitLength, 0);
}

@end