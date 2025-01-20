@interface SBSystemApertureDebuggingUtilityBufferEntry
- (NSString)stackDepiction;
- (SBSAContext)context;
- (SBSAPreferences)preferences;
- (SBSystemApertureDebuggingUtilityBufferEntry)initWithQueryIteration:(unint64_t)a3 preferences:(id)a4 context:(id)a5 stackDepiction:(id)a6;
- (unint64_t)queryIteration;
@end

@implementation SBSystemApertureDebuggingUtilityBufferEntry

- (SBSystemApertureDebuggingUtilityBufferEntry)initWithQueryIteration:(unint64_t)a3 preferences:(id)a4 context:(id)a5 stackDepiction:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBSystemApertureDebuggingUtilityBufferEntry;
  v14 = [(SBSystemApertureDebuggingUtilityBufferEntry *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_queryIteration = a3;
    objc_storeStrong((id *)&v14->_preferences, a4);
    objc_storeStrong((id *)&v15->_context, a5);
    objc_storeStrong((id *)&v15->_stackDepiction, a6);
  }

  return v15;
}

- (unint64_t)queryIteration
{
  return self->_queryIteration;
}

- (SBSAPreferences)preferences
{
  return self->_preferences;
}

- (SBSAContext)context
{
  return self->_context;
}

- (NSString)stackDepiction
{
  return self->_stackDepiction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackDepiction, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end