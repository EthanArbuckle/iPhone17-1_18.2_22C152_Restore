@interface WFPencilActionConfigurationMetricsCacheValue
- ($4BD088D663DD6A85D21B478F22F2D506)value;
- (WFPencilActionConfigurationMetricsCacheValue)initWithValue:(id *)a3;
- (void)setValue:(id *)a3;
@end

@implementation WFPencilActionConfigurationMetricsCacheValue

- (void)setValue:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_value.grid.chicletWidth = *(_OWORD *)&a3->var2.var1;
  *(_OWORD *)&self->_value.sidebar.leadingPadding = v4;
  *(_OWORD *)&self->_value.interfaceOrientation = v3;
  long long v5 = *(_OWORD *)&a3->var2.var3.top;
  long long v6 = *(_OWORD *)&a3->var2.var3.bottom;
  long long v7 = *(_OWORD *)&a3->var3.var0;
  *(_OWORD *)&self->_value.sheet.insets.top = *(_OWORD *)&a3->var3.var2.top;
  *(_OWORD *)&self->_value.sheet.grabberTopSpacing = v7;
  *(_OWORD *)&self->_value.grid.insets.bottom = v6;
  *(_OWORD *)&self->_value.grid.insets.top = v5;
  long long v8 = *(_OWORD *)&a3->var3.var2.bottom;
  long long v9 = *(_OWORD *)&a3->var4.var0;
  long long v10 = *(_OWORD *)&a3->var4.var2.top;
  *(_OWORD *)&self->_value.searchBar.containerInsets.bottom = *(_OWORD *)&a3->var4.var2.bottom;
  *(_OWORD *)&self->_value.searchBar.containerInsets.top = v10;
  *(_OWORD *)&self->_value.searchBar.barWidth = v9;
  *(_OWORD *)&self->_value.sheet.insets.bottom = v8;
}

- ($4BD088D663DD6A85D21B478F22F2D506)value
{
  long long v3 = *(_OWORD *)&self->var3.var2.trailing;
  long long v4 = *(_OWORD *)&self->var4.var2.leading;
  *(_OWORD *)&retstr->var4.var0 = *(_OWORD *)&self->var4.var1;
  *(_OWORD *)&retstr->var4.var2.top = v4;
  *(_OWORD *)&retstr->var4.var2.bottom = *(_OWORD *)&self->var4.var2.trailing;
  long long v5 = *(_OWORD *)&self->var2.var3.leading;
  long long v6 = *(_OWORD *)&self->var3.var1;
  *(_OWORD *)&retstr->var2.var3.bottom = *(_OWORD *)&self->var2.var3.trailing;
  *(_OWORD *)&retstr->var3.var0 = v6;
  *(_OWORD *)&retstr->var3.var2.top = *(_OWORD *)&self->var3.var2.leading;
  *(_OWORD *)&retstr->var3.var2.bottom = v3;
  long long v7 = *(_OWORD *)&self->var2.var0;
  *($F24F406B2B787EFB06265DBA3D28CBD5 *)&retstr->var0 = self->var1;
  *(_OWORD *)&retstr->var1.var1 = v7;
  *(_OWORD *)&retstr->var2.var1 = *(_OWORD *)&self->var2.var2;
  *(_OWORD *)&retstr->var2.var3.top = v5;
  return self;
}

- (WFPencilActionConfigurationMetricsCacheValue)initWithValue:(id *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)WFPencilActionConfigurationMetricsCacheValue;
  long long v4 = [(WFPencilActionConfigurationMetricsCacheValue *)&v16 init];
  long long v5 = (WFPencilActionConfigurationMetricsCacheValue *)v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0;
    long long v7 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&a3->var2.var1;
    *(_OWORD *)(v4 + 24) = v7;
    *(_OWORD *)(v4 + 8) = v6;
    long long v8 = *(_OWORD *)&a3->var2.var3.top;
    long long v9 = *(_OWORD *)&a3->var2.var3.bottom;
    long long v10 = *(_OWORD *)&a3->var3.var0;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&a3->var3.var2.top;
    *(_OWORD *)(v4 + 88) = v10;
    *(_OWORD *)(v4 + 72) = v9;
    *(_OWORD *)(v4 + 56) = v8;
    long long v11 = *(_OWORD *)&a3->var3.var2.bottom;
    long long v12 = *(_OWORD *)&a3->var4.var0;
    long long v13 = *(_OWORD *)&a3->var4.var2.top;
    *(_OWORD *)(v4 + 168) = *(_OWORD *)&a3->var4.var2.bottom;
    *(_OWORD *)(v4 + 152) = v13;
    *(_OWORD *)(v4 + 136) = v12;
    *(_OWORD *)(v4 + 120) = v11;
    v14 = v4;
  }

  return v5;
}

@end