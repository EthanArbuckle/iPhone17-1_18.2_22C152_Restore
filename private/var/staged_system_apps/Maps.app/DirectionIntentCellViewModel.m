@interface DirectionIntentCellViewModel
- (DirectionIntentCellViewModel)initWithLocalSearchCompletion:(id)a3;
- (MKLocalSearchCompletion)localSearchCompletion;
- (NSString)subtitleCellString;
- (NSString)titleCellString;
- (id)_titleOfResolvedItem:(id)a3 withSearchCompletion:(id)a4;
- (void)_calculateStrings;
- (void)setLocalSearchCompletion:(id)a3;
- (void)setSubtitleCellString:(id)a3;
- (void)setTitleCellString:(id)a3;
@end

@implementation DirectionIntentCellViewModel

- (DirectionIntentCellViewModel)initWithLocalSearchCompletion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DirectionIntentCellViewModel;
  v6 = [(DirectionIntentCellViewModel *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localSearchCompletion, a3);
    [(DirectionIntentCellViewModel *)v7 _calculateStrings];
  }

  return v7;
}

- (void)_calculateStrings
{
  v3 = [(DirectionIntentCellViewModel *)self localSearchCompletion];
  v4 = [v3 title];

  id v5 = [(DirectionIntentCellViewModel *)self localSearchCompletion];
  v6 = [v5 subtitle];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005FC4C8;
  v10[3] = &unk_1012F2018;
  v10[4] = self;
  v7 = objc_retainBlock(v10);
  v8 = ((void (*)(void *, void *))v7[2])(v7, v4);
  [(DirectionIntentCellViewModel *)self setTitleCellString:v8];

  objc_super v9 = ((void (*)(void *, void *))v7[2])(v7, v6);
  [(DirectionIntentCellViewModel *)self setSubtitleCellString:v9];
}

- (id)_titleOfResolvedItem:(id)a3 withSearchCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = [v5 hasResultIndex];
  if (v6 && (v7 & 1) != 0)
  {
    uint64_t v8 = [v6 title];
  }
  else
  {
    uint64_t v8 = [v5 extractedTerm];
  }
  objc_super v9 = (void *)v8;

  return v9;
}

- (NSString)titleCellString
{
  return self->_titleCellString;
}

- (void)setTitleCellString:(id)a3
{
}

- (NSString)subtitleCellString
{
  return self->_subtitleCellString;
}

- (void)setSubtitleCellString:(id)a3
{
}

- (MKLocalSearchCompletion)localSearchCompletion
{
  return self->_localSearchCompletion;
}

- (void)setLocalSearchCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSearchCompletion, 0);
  objc_storeStrong((id *)&self->_subtitleCellString, 0);

  objc_storeStrong((id *)&self->_titleCellString, 0);
}

@end