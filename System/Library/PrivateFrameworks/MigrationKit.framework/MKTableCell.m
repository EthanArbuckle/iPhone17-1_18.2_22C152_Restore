@interface MKTableCell
+ (id)cellWithValue:(id)a3 formatter:(id)a4;
+ (id)cellWithValue:(id)a3 formatter:(id)a4 alignment:(int64_t)a5;
+ (id)cellWithValue:(id)a3 formatter:(id)a4 columnSpan:(int)a5;
+ (id)cellWithValue:(id)a3 formatter:(id)a4 columnSpan:(int)a5 alignment:(int64_t)a6;
- (NSFormatter)formatter;
- (NSObject)value;
- (id)formattedValue;
- (int)columnSpan;
- (int64_t)alignment;
- (void)setAlignment:(int64_t)a3;
- (void)setColumnSpan:(int)a3;
- (void)setFormatter:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MKTableCell

+ (id)cellWithValue:(id)a3 formatter:(id)a4
{
  return +[MKTableCell cellWithValue:a3 formatter:a4 columnSpan:1 alignment:0];
}

+ (id)cellWithValue:(id)a3 formatter:(id)a4 columnSpan:(int)a5
{
  return +[MKTableCell cellWithValue:a3 formatter:a4 columnSpan:*(void *)&a5 alignment:0];
}

+ (id)cellWithValue:(id)a3 formatter:(id)a4 alignment:(int64_t)a5
{
  return +[MKTableCell cellWithValue:a3 formatter:a4 columnSpan:1 alignment:a5];
}

+ (id)cellWithValue:(id)a3 formatter:(id)a4 columnSpan:(int)a5 alignment:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v9 = a3;
  id v10 = a4;
  v11 = objc_alloc_init(MKTableCell);
  v12 = v11;
  if (v11)
  {
    [(MKTableCell *)v11 setValue:v9];
    [(MKTableCell *)v12 setFormatter:v10];
    [(MKTableCell *)v12 setColumnSpan:v7];
    [(MKTableCell *)v12 setAlignment:a6];
  }

  return v12;
}

- (id)formattedValue
{
  v3 = [(MKTableCell *)self formatter];
  if (v3)
  {
    v4 = [(MKTableCell *)self formatter];
    v5 = [(MKTableCell *)self value];
    v6 = [v4 stringForObjectValue:v5];
  }
  else
  {
    v4 = [(MKTableCell *)self value];
    v6 = [v4 description];
  }

  return v6;
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (int)columnSpan
{
  return self->_columnSpan;
}

- (void)setColumnSpan:(int)a3
{
  self->_columnSpan = a3;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (NSFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end