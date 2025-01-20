@interface WFParameterStateProcessingContext
- (BOOL)isInputParameter;
- (NSString)widgetSizeClass;
- (WFContentAttributionTracker)contentAttributionTracker;
- (WFParameter)parameter;
- (WFParameterStateProcessingContext)initWithVariableSource:(id)a3 parameter:(id)a4 isInputParameter:(BOOL)a5 environment:(int64_t)a6 contentAttributionTracker:(id)a7 widgetSizeClass:(id)a8;
- (WFVariableDataSource)variableSource;
- (int64_t)environment;
- (int64_t)maximumItemCount;
- (void)addContentAttributionSet:(id)a3;
@end

@implementation WFParameterStateProcessingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSizeClass, 0);
  objc_storeStrong((id *)&self->_contentAttributionTracker, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_variableSource, 0);
}

- (int64_t)maximumItemCount
{
  return self->_maximumItemCount;
}

- (NSString)widgetSizeClass
{
  return self->_widgetSizeClass;
}

- (WFContentAttributionTracker)contentAttributionTracker
{
  return self->_contentAttributionTracker;
}

- (int64_t)environment
{
  return self->_environment;
}

- (BOOL)isInputParameter
{
  return self->_isInputParameter;
}

- (WFParameter)parameter
{
  return self->_parameter;
}

- (WFVariableDataSource)variableSource
{
  return self->_variableSource;
}

- (void)addContentAttributionSet:(id)a3
{
  id v4 = a3;
  id v6 = [(WFParameterStateProcessingContext *)self contentAttributionTracker];
  v5 = [(WFParameterStateProcessingContext *)self parameter];
  [v6 addAttributionSet:v4 forParameter:v5];
}

- (WFParameterStateProcessingContext)initWithVariableSource:(id)a3 parameter:(id)a4 isInputParameter:(BOOL)a5 environment:(int64_t)a6 contentAttributionTracker:(id)a7 widgetSizeClass:(id)a8
{
  id v29 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"WFParameterStateProcessingContext.m", 23, @"Invalid parameter not satisfying: %@", @"parameter" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"WFParameterStateProcessingContext.m", 24, @"Invalid parameter not satisfying: %@", @"contentAttributionTracker" object file lineNumber description];

LABEL_3:
  v30.receiver = self;
  v30.super_class = (Class)WFParameterStateProcessingContext;
  v18 = [(WFParameterStateProcessingContext *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_variableSource, a3);
    objc_storeStrong((id *)&v19->_parameter, a4);
    v19->_isInputParameter = a5;
    v19->_environment = a6;
    objc_storeStrong((id *)&v19->_contentAttributionTracker, a7);
    objc_storeStrong((id *)&v19->_widgetSizeClass, a8);
    if ([v15 allowsMultipleValues])
    {
      int v20 = [v15 isRangedSizeArray];
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      if (v17 && v20)
      {
        uint64_t v22 = [v15 arraySizeRangeForWidgetFamily:v17];
        uint64_t v21 = v23 + v22 - 1;
      }
    }
    else
    {
      uint64_t v21 = 1;
    }
    v19->_maximumItemCount = v21;
    v24 = v19;
  }

  return v19;
}

@end