@interface TUIInstantiateContext
- ($0220C184157FC9E8AD112820945A9326)animationDefinitonWithNode:(id)a3 nameAttribute:(unsigned __int16)a4;
- ($0220C184157FC9E8AD112820945A9326)elementDefinitionWithNameAttribute:(unsigned __int16)a3 node:(id)a4;
- ($0220C184157FC9E8AD112820945A9326)letDefinitionWithNameAttribute:(unsigned __int16)a3 valueAttribute:(unsigned __int16)a4 node:(id)a5;
- ($0F674443F67B1BBEFA3E91226872A32D)animationReferenceForAttribute:(unsigned __int16)a3 node:(id)a4;
- ($201E9A47BE70A2B12CCA2F48B75AA2F7)bindingNameForAttribute:(unsigned __int16)a3 node:(id)a4;
- ($201E9A47BE70A2B12CCA2F48B75AA2F7)constantNameForAttribute:(unsigned __int16)a3 node:(id)a4;
- ($201E9A47BE70A2B12CCA2F48B75AA2F7)globalsNameForAttribute:(unsigned __int16)a3 node:(id)a4;
- ($37BEA69CB2A2744B1AE9B34F7442AF12)styleDefinitionWithNode:(SEL)a3 nameAttribute:(id)a4 inheritAttribute:(unsigned __int16)a5;
- ($4AC7F32B1C626A3A04933030E84D26E0)springTimingParametersForAttribute:(SEL)a3 node:(unsigned __int16)a4;
- ($4AC7F32B1C626A3A04933030E84D26E0)springTimingParametersFromValue:(SEL)a3;
- ($5B0274039C15E806FA91EF6B5728B838)childrenForNode:(id)a3;
- ($61A80719B04F7407D3E47539F1B23CAA)feedId;
- ($738B17BD11CC339B30296C0EA03CEC2B)closureForNode:(id)a3;
- ($738B17BD11CC339B30296C0EA03CEC2B)elementReferenceForAttribute:(unsigned __int16)a3 node:(id)a4;
- ($738B17BD11CC339B30296C0EA03CEC2B)enumeratorWithAttribute:(unsigned __int16)a3 node:(id)a4;
- ($738B17BD11CC339B30296C0EA03CEC2B)lookupUnconditionalAttribute:(unsigned __int16)a3 attributes:(id)a4;
- ($738B17BD11CC339B30296C0EA03CEC2B)nameReferenceForAttribute:(unsigned __int16)a3 node:(id)a4;
- ($738B17BD11CC339B30296C0EA03CEC2B)unconditionalValueForAttribute:(unsigned __int16)a3 node:(id)a4;
- ($738B17BD11CC339B30296C0EA03CEC2B)unresolvedValueForAttribute:(unsigned __int16)a3 node:(id)a4;
- ($7E080378D8F67055EE0984892F39872B)propertyNameForAttribute:(unsigned __int16)a3 node:(id)a4;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)lengthForAttribute:(SEL)a3 node:(unsigned __int16)a4;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)lengthFromValue:(SEL)a3;
- (BOOL)BOOLForAttribute:(unsigned __int16)a3 node:(id)a4;
- (BOOL)BOOLForAttribute:(unsigned __int16)a3 withDefault:(BOOL)a4 node:(id)a5;
- (BOOL)BOOLForCondition:(id)a3;
- (BOOL)BOOLFromValue:(id)a3;
- (BOOL)recordErrors;
- (BOOL)updateComponentGlobals:(id)a3;
- (CGAffineTransform)transformForAttribute:(SEL)a3 node:(unsigned __int16)a4;
- (CGAffineTransform)transformFromValue:(SEL)a3;
- (CGSize)sizeForAttribute:(unsigned __int16)a3 node:(id)a4;
- (CGSize)sizeFromValue:(id)a3;
- (NSUUID)UUID;
- (TUIActionHandlerDelegate)actionDelegate;
- (TUIDynamicControlling)dynamicController;
- (TUIEnvironment)environment;
- (TUIIdentifierMap)identifierMap;
- (TUIInstantiateCapturing)capture;
- (TUIInstantiateContext)initWithDelegate:(id)a3 package:(id)a4 manager:(id)a5 identifierMap:(id)a6 environment:(id)a7 state:(id)a8 feedId:(id)a9;
- (TUIInstantiateContextDelegate)delegate;
- (TUIInstantiatingEntry)entry;
- (TUIManager)manager;
- (TUIPackage)package;
- (TUIStatsEventCollector)statsCollector;
- (TUITransactionCoordinating)transactionCoordinator;
- (UIEdgeInsets)insetsForAttribute:(unsigned __int16)a3 node:(id)a4;
- (UIEdgeInsets)insetsForAttribute:(unsigned __int16)a3 withDefault:(UIEdgeInsets)a4 node:(id)a5;
- (const)_resolvedValueForAttribute:(unsigned __int16)a3 node:(id)a4;
- (double)floatForAttribute:(unsigned __int16)a3 node:(id)a4;
- (double)floatForAttribute:(unsigned __int16)a3 withDefault:(double)a4 node:(id)a5;
- (double)floatFromValue:(id)a3;
- (double)floatFromValue:(id)a3 default:(double)a4;
- (id)_xpathForLocation:(id)a3;
- (id)actionObject;
- (id)baseURLForNode:(id)a3;
- (id)colorArrayForAttribute:(unsigned __int16)a3 node:(id)a4;
- (id)colorForAttribute:(unsigned __int16)a3 node:(id)a4;
- (id)colorFromValue:(id)a3;
- (id)componentViewStateWithName:(id)a3;
- (id)debugDumpEnvironmentContainerStructure:(id)a3;
- (id)dynamicStateForKind:(id)a3 instance:(id)a4 parameters:(id)a5;
- (id)environmentChildContainersForContainer:(id)a3;
- (id)environmentContainersUsingGlobals;
- (id)evaluateStringForAttribute:(unsigned __int16)a3 node:(id)a4;
- (id)evaluationErrors;
- (id)focusStyleForAttribute:(unsigned __int16)a3 node:(id)a4;
- (id)fontSpecForNode:(id)a3;
- (id)guideSpecFromValue:(id)a3;
- (id)guidesForNode:(id)a3;
- (id)identifierWithNode:(id)a3;
- (id)instantiateAnimationReference:(id)a3;
- (id)instantiateBinding:(id)a3 withDynamicProvider:(id)a4 childrenOfNode:(id)a5;
- (id)instantiateEnumerator:(id)a3 withChildrenOfNode:(id)a4 options:(id)a5;
- (id)instantiateTemplate:(id)a3 bindings:(id)a4 actionObject:(id)a5;
- (id)modelIdentifierByAppendingString:(id)a3 node:(id)a4;
- (id)modelIdentifierWithNode:(id)a3;
- (id)objectForAttribute:(unsigned __int16)a3 node:(id)a4;
- (id)objectFromValue:(id)a3;
- (id)pointerForNode:(id)a3;
- (id)pointerStyleForNode:(id)a3;
- (id)saveState;
- (id)serviceConformingToProtocol:(id)a3;
- (id)snapForAttribute:(unsigned __int16)a3 node:(id)a4;
- (id)snapshotWithClosure:(id)a3;
- (id)stringArrayForAttribute:(unsigned __int16)a3 node:(id)a4;
- (id)stringForAttribute:(unsigned __int16)a3 node:(id)a4;
- (id)stringFromName:(id)a3;
- (id)stringFromValue:(id)a3;
- (id)structForAttribute:(unsigned __int16)a3 node:(id)a4;
- (id)viewStateForNode:(id)a3 binding:(id)a4;
- (int64_t)integerForAttribute:(unsigned __int16)a3 withDefault:(int64_t)a4 node:(id)a5;
- (int64_t)integerFromValue:(id)a3 default:(int64_t)a4;
- (unint64_t)animationCalculationModeAndCurveForNode:(id)a3;
- (unint64_t)childCountForNode:(id)a3;
- (unint64_t)evaluateBinding:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 block:(id)a8;
- (unint64_t)evaluateBinding:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 nodes:(id)a8 flags:(unint64_t)a9 containingObject:(id)a10 builder:(id)a11;
- (unint64_t)evaluateEnumerator:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 block:(id)a8;
- (unint64_t)evaluateEnumerator:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 nodes:(id)a8 flags:(unint64_t)a9 containingObject:(id)a10 builder:(id)a11;
- (unint64_t)unsignedIntegerForAttribute:(unsigned __int16)a3 withDefault:(unint64_t)a4 node:(id)a5;
- (unint64_t)unsignedIntegerFromValue:(id)a3 default:(unint64_t)a4;
- (unint64_t)updateWithEntry:(id)a3 withBuilder:(id)a4 environmentContainer:(id)a5;
- (void)_context;
- (void)clearErrors;
- (void)dealloc;
- (void)defineAnimation:(id)a3 closure:(id)a4;
- (void)defineBindingWithName:(id)a3 value:(id)a4;
- (void)defineBool:(BOOL)a3 withName:(id)a4;
- (void)defineComponentBindingWithName:(id)a3 value:(id)a4;
- (void)defineConstantWithName:(id)a3 value:(id)a4;
- (void)defineElement:(id)a3 closure:(id)a4;
- (void)defineLet:(id)a3 closure:(id)a4;
- (void)defineStruct:(id)a3 withName:(id)a4;
- (void)defineStyle:(id *)a3 closure:(id)a4;
- (void)enumerateChildrenOfNode:(id)a3 block:(id)a4;
- (void)evaluateBinding:(id)a3 withObject:(id)a4 nodes:(id)a5 containingObject:(id)a6 builder:(id)a7;
- (void)evaluateEnumerator:(id)a3 withObject:(id)a4 nodes:(id)a5 containingObject:(id)a6 builder:(id)a7;
- (void)evaluateStates:(id)a3 block:(id)a4;
- (void)evaluateWithSnapshot:(id)a3 block:(id)a4;
- (void)includeTemplateWithURL:(id)a3;
- (void)instantiateComponentWithReference:(id)a3 withChildrenOfNode:(id)a4;
- (void)instantiateElementReference:(id)a3 withChildrenOfNode:(id)a4;
- (void)instantiateNamedElementReference:(id)a3;
- (void)instantiateNode:(id)a3 withBuilder:(id)a4;
- (void)instantiateRender:(id)a3 withChildrenOfNode:(id)a4;
- (void)reportError:(unint64_t)a3;
- (void)resetInstantiationStats:(BOOL)a3;
- (void)setActionDelegate:(id)a3;
- (void)setCapture:(id)a3;
- (void)setDynamicController:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setRecordErrors:(BOOL)a3;
- (void)setStatsCollector:(id)a3;
- (void)setTransactionCoordinator:(id)a3;
- (void)updateComponentBody:(id)a3;
- (void)useGlobalsWithName:(id)a3;
- (void)usedDynamicColor;
@end

@implementation TUIInstantiateContext

- (TUIInstantiateContext)initWithDelegate:(id)a3 package:(id)a4 manager:(id)a5 identifierMap:(id)a6 environment:(id)a7 state:(id)a8 feedId:(id)a9
{
  id obj = a3;
  id v15 = a4;
  id v21 = a5;
  id v22 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)TUIInstantiateContext;
  v18 = [(TUIInstantiateContext *)&v24 init];
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    v18->_feedId.uniqueIdentifier = a9.var0;
    objc_storeWeak((id *)&v18->_delegate, obj);
    objc_storeStrong(p_isa + 6, a6);
    objc_storeStrong(p_isa + 7, a7);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 4, a5);
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  context = (TUI::Evaluation::Context *)self->_context;
  if (context)
  {
    TUI::Evaluation::Context::~Context(context);
    operator delete();
  }
  conformanceCache = self->_conformanceCache;
  if (conformanceCache)
  {
    v5 = (void *)conformanceCache[9];
    if (v5)
    {
      conformanceCache[10] = v5;
      operator delete(v5);
    }
    operator delete();
  }
  v6.receiver = self;
  v6.super_class = (Class)TUIInstantiateContext;
  [(TUIInstantiateContext *)&v6 dealloc];
}

- (TUIPackage)package
{
  return self->_package;
}

- (id)serviceConformingToProtocol:(id)a3
{
  id v4 = a3;
  v5 = [(TUIInstantiateContext *)self delegate];
  objc_super v6 = [v5 instantiateContext:self serviceConformingToProtocol:v4];

  return v6;
}

- (id)instantiateTemplate:(id)a3 bindings:(id)a4 actionObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *((void *)self->_context + 96);
  if (v11) {
    *(void *)(v11 + 27848) = mach_absolute_time();
  }
  if (v8)
  {
    v12 = [v8 package];
    v13 = v12;
    if (v12 != self->_package)
    {
      v14 = 0;
LABEL_12:

      goto LABEL_14;
    }

    if (v13)
    {
      kdebug_trace();
      [(TUIInstantiateContext *)self clearErrors];
      id v15 = [[_TUIInstantiateEntry alloc] initWithTemplate:v8 bindings:v9 actionObject:v10];
      TUI::Evaluation::Context::reset((TUI::Evaluation::Context *)self->_context);
      id v17 = TUI::Evaluation::Context::instantiateEntry((id *)self->_context, v15);
      kdebug_trace();
      if (v11)
      {
        unint64_t v18 = *(void *)(v11 + 27848);
        uint64_t v19 = mach_absolute_time();
        uint64_t v20 = v19 - v18;
        if (v18 >= v19) {
          uint64_t v20 = v18 - v19;
        }
        *(void *)(v11 + 27816) += v20;
      }
      v13 = v17;

      v14 = v13;
      goto LABEL_12;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (TUIInstantiatingEntry)entry
{
  return (TUIInstantiatingEntry *)*((id *)self->_context + 94);
}

- (id)saveState
{
  v3 = [TUIInstantiateContextState alloc];
  id v4 = [*((id *)self->_context + 20) copy];
  v5 = [(TUIInstantiateContextState *)v3 initWithViewStateMapping:v4];

  return v5;
}

- (void)_context
{
  return self->_context;
}

- (id)actionObject
{
  return *((id *)self->_context + 68);
}

- (void)setEnvironment:(id)a3
{
  v5 = (TUIEnvironment *)a3;
  environment = self->_environment;
  v7 = v5;
  if (environment != v5 && ![(TUIEnvironment *)environment isEqualToEnvironment:v5])
  {
    objc_storeStrong((id *)&self->_environment, a3);
    TUI::Evaluation::Context::setEnvironment((id *)self->_context, v7);
  }
}

- (NSUUID)UUID
{
  return [(TUIIdentifierMap *)self->_identifierMap UUID];
}

- (id)evaluationErrors
{
  return TUI::Evaluation::Context::errors((id *)self->_context);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)lengthFromValue:(SEL)a3
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:5];
  if (!TUIValueNotNil(a4.var0)) {
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
  }
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a4.var0, (double *)v8);
  objc_super v6 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUI::Evaluation::ResolvedValue::lengthValue(v8, (const TUI::Evaluation::Context *)self->_context);

  return v6;
}

- (double)floatFromValue:(id)a3
{
  [(TUIInstantiateContext *)self floatFromValue:a3.var0 default:0.0];
  return result;
}

- (double)floatFromValue:(id)a3 default:(double)a4
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:1];
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v8);
    a4 = TUI::Evaluation::ResolvedValue::floatValue((TUI::Evaluation::ResolvedValue *)v8, (const TUI::Evaluation::Context *)self->_context);
  }
  return a4;
}

- (unint64_t)unsignedIntegerFromValue:(id)a3 default:(unint64_t)a4
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:2];
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v8);
    a4 = TUI::Evaluation::ResolvedValue::integerValue((TUI::Evaluation::ResolvedValue *)v8, (const TUI::Evaluation::Context *)self->_context);
  }
  return a4;
}

- (int64_t)integerFromValue:(id)a3 default:(int64_t)a4
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:2];
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v8);
    a4 = TUI::Evaluation::ResolvedValue::integerValue((TUI::Evaluation::ResolvedValue *)v8, (const TUI::Evaluation::Context *)self->_context);
  }
  return a4;
}

- (CGSize)sizeFromValue:(id)a3
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:8];
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, (double *)v10);
    double width = TUI::Evaluation::ResolvedValue::sizeValue(v10, (const TUI::Evaluation::Context *)self->_context);
    CGFloat height = v6;
  }
  else
  {
    double width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.double width = v8;
  return result;
}

- (id)colorFromValue:(id)a3
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:10];
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, (double *)v7);
    v5 = TUI::Evaluation::ResolvedValue::colorValue(v7, (const TUI::Evaluation::Context *)self->_context);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)BOOLFromValue:(id)a3
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:3];
  if (!TUIValueNotNil(a3.var0)) {
    return 0;
  }
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v7);
  unsigned __int8 v5 = TUI::Evaluation::ResolvedValue::BOOLValue((TUI::Evaluation::ResolvedValue *)v7, (const TUI::Evaluation::Context *)self->_context);

  return v5;
}

- (BOOL)BOOLForCondition:(id)a3
{
  var0 = (TUI::Instruction::Decoder *)a3.var0;
  if (!TUIConditionNotNil(a3.var0)) {
    return 1;
  }
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:0];
  TUI::Evaluation::Context::resolve((uint64_t)self->_context, var0, (uint64_t)v7);
  unsigned __int8 v5 = TUI::Evaluation::ResolvedValue::BOOLValue((TUI::Evaluation::ResolvedValue *)v7, (const TUI::Evaluation::Context *)self->_context);

  return v5;
}

- (id)stringFromValue:(id)a3
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:6];
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v7);
    unsigned __int8 v5 = TUI::Evaluation::ResolvedValue::stringValue((TUI::Evaluation::ResolvedValue *)v7, (TUI::Symbol::Tab **)self->_context);
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)objectFromValue:(id)a3
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:7];
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a3.var0, v7);
    unsigned __int8 v5 = TUI::Evaluation::ResolvedValue::objectValue((TUI::Evaluation::ResolvedValue *)v7, (TUI::Symbol::Tab **)self->_context);
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (CGAffineTransform)transformFromValue:(SEL)a3
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:4];
  CGSize result = (CGAffineTransform *)TUIValueNotNil(a4.var0);
  if (result)
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a4.var0, v9);
    TUI::Evaluation::ResolvedValue::transformValue((TUI::Evaluation::ResolvedValue *)v9, (const TUI::Evaluation::Context *)self->_context, retstr);
  }
  else
  {
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  return result;
}

- ($4AC7F32B1C626A3A04933030E84D26E0)springTimingParametersFromValue:(SEL)a3
{
  [(TUIStatsEventCollector *)self->_statsCollector recordEvent:28];
  CGSize result = ($4AC7F32B1C626A3A04933030E84D26E0 *)TUIValueNotNil(a4.var0);
  if (result)
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, (TUI::Instruction::Decoder *)a4.var0, (double *)v8);
    TUI::Evaluation::ResolvedValue::springTimingParameters(v8, (const TUI::Evaluation::Context *)self->_context, (uint64_t)retstr);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = TUISpringTimingParametersZero;
    *(_OWORD *)&retstr->var2 = unk_243500;
    retstr->var3.dy = 0.0;
  }
  return result;
}

- (id)stringFromName:(id)a3
{
  unint64_t v4 = a3;
  if (TUINameIsValid(*(_DWORD *)&a3))
  {
    TUI::Symbol::Tab::string(*((TUI::Symbol::Tab **)self->_context + 70), v4);
    unsigned __int8 v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v5 = &stru_257BF0;
  }

  return v5;
}

- (id)guideSpecFromValue:(id)a3
{
  var0 = (TUI::Instruction::Decoder *)a3.var0;
  if (TUIValueNotNil(a3.var0))
  {
    TUI::Evaluation::Context::resolve((uint64_t)self->_context, var0, (double *)v7);
    unsigned __int8 v5 = TUI::Evaluation::ResolvedValue::guideValue(v7, (const TUI::Evaluation::Context *)self->_context);
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)instantiateBinding:(id)a3 withDynamicProvider:(id)a4 childrenOfNode:(id)a5
{
  id v8 = a4;
  unsigned int var0 = a5.var0;
  unint64_t v10 = TUI::Evaluation::Context::childrenOfNode((uint64_t)self->_context, a5.var0);
  unsigned int v11 = TUI::Evaluation::Context::closureForNode((uint64_t)self->_context, var0);
  context = self->_context;
  char v13 = *((unsigned char *)context + 184);
  id v14 = (id)objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    id v14 = [*((id *)context + 21) builderClassForDynamicInstantiation];
  }
  id v15 = v14;
  id v16 = [(TUIInstantiateContext *)self snapshotWithClosure:v11];
  id v17 = [v8 instantiateAsBinding:*(unsigned int *)&a3 options:0 flags:2 * (v13 & 1) builderClass:v15 nodes:v10 snapshot:v16 context:self];

  return v17;
}

- (unint64_t)updateWithEntry:(id)a3 withBuilder:(id)a4 environmentContainer:(id)a5
{
  return TUI::Evaluation::Context::updateEntryWithBuilderEnvironmentContainer((uint64_t)self->_context, a3, a4, a5);
}

- (id)instantiateEnumerator:(id)a3 withChildrenOfNode:(id)a4 options:(id)a5
{
  id v8 = a5;
  context = self->_context;
  char v10 = context[184];
  unsigned int var0 = a4.var0;
  unint64_t v12 = TUI::Evaluation::Context::childrenOfNode((uint64_t)context, a4.var0);
  unsigned int v13 = TUI::Evaluation::Context::closureForNode((uint64_t)self->_context, var0);
  id v14 = TUI::Evaluation::Context::instantiateEnumeratorWithNodes((uint64_t)context, a3.var0, v12, v13, v8, 2 * (v10 & 1));

  return v14;
}

- (id)snapshotWithClosure:(id)a3
{
  v3 = [TUIInstantiateContextSnapshot alloc];
  TUI::Evaluation::Context::newSnapshot();
}

- (unint64_t)evaluateEnumerator:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 block:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  BOOL v16 = !TUIEnumeratorNotNil(a3.var0);
  if (!v15) {
    LOBYTE(v16) = 1;
  }
  if (v16)
  {
    unint64_t v19 = 0;
  }
  else
  {
    uint64_t v17 = *((void *)self->_context + 72);
    if (*(void *)(v17 + 264) <= (unint64_t)a3.var0) {
      unint64_t v18 = 0;
    }
    else {
      unint64_t v18 = (_DWORD *)(*(void *)(v17 + 256) + 16 * a3.var0);
    }
    sub_8CC8C((uint64_t)&v22, v18);
    Entry v20 = (Entry)v23;
    unint64_t v19 = TUI::Evaluation::Context::evaluateEnumeratorWithBlock((void *)self->_context, v22, v20, v14, a5, a6, a7.var0, v15);
  }

  return v19;
}

- (unint64_t)evaluateBinding:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 block:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  BOOL v17 = !TUINameIsValid(*(_DWORD *)&a3);
  if (!v15) {
    LOBYTE(v17) = 1;
  }
  if (v17)
  {
    unint64_t v21 = 0;
  }
  else
  {
    unint64_t v18 = TUI::Package::Enumerator::Entry::binding((TUI::Package::Enumerator::Entry *)*(unsigned int *)&a3, v16);
    Entry v20 = v19;
    unint64_t v21 = TUI::Evaluation::Context::evaluateEnumeratorWithBlock((void *)self->_context, v18, v20, v14, a5, a6, a7.var0, v15);
  }

  return v21;
}

- (unint64_t)evaluateEnumerator:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 nodes:(id)a8 flags:(unint64_t)a9 containingObject:(id)a10 builder:(id)a11
{
  return TUI::Evaluation::Context::evaluateEnumeratorWithNodes((uint64_t)self->_context, a3.var0, a4, a5, a6, a7.var0, *(void *)&a8, a9, a10, a11);
}

- (unint64_t)evaluateBinding:(id)a3 withObject:(id)a4 atIndex:(unint64_t)a5 count:(unint64_t)a6 uniqueID:(id)a7 nodes:(id)a8 flags:(unint64_t)a9 containingObject:(id)a10 builder:(id)a11
{
  return TUI::Evaluation::Context::evaluateBindingWithNodes((uint64_t)self->_context, *(_DWORD *)&a3, a4, a5, a6, a7.var0, *(void *)&a8, a9, (uint64_t)a10, a11);
}

- (void)evaluateEnumerator:(id)a3 withObject:(id)a4 nodes:(id)a5 containingObject:(id)a6 builder:(id)a7
{
}

- (void)evaluateBinding:(id)a3 withObject:(id)a4 nodes:(id)a5 containingObject:(id)a6 builder:(id)a7
{
}

- (void)reportError:(unint64_t)a3
{
}

- (id)identifierWithNode:(id)a3
{
  return TUI::Evaluation::Context::identifierWithNode((uint64_t)self->_context, a3.var0);
}

- (id)modelIdentifierWithNode:(id)a3
{
  unint64_t v4 = TUI::Evaluation::Context::identifierWithNode((uint64_t)self->_context, a3.var0);
  unsigned __int8 v5 = [(TUIIdentifierMap *)self->_identifierMap UUID];
  double v6 = [v4 tui_identifierByPrependingUUID:v5];

  return v6;
}

- (id)modelIdentifierByAppendingString:(id)a3 node:(id)a4
{
  id v6 = a3;
  v7 = TUI::Evaluation::Context::identifierWithNode((uint64_t)self->_context, a4.var0);
  id v8 = [v7 tui_identifierByAppendingString:v6];
  double v9 = [(TUIIdentifierMap *)self->_identifierMap UUID];
  char v10 = [v8 tui_identifierByPrependingUUID:v9];

  return v10;
}

- (void)evaluateWithSnapshot:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      context = (uint64_t *)self->_context;
      [v6 contextSnapshot];
      TUI::Evaluation::Context::evaluateWithSnapshot(context, &v10, v8);
      if (v11) {
        sub_123E4(v11);
      }
    }
  }
}

- (void)clearErrors
{
}

- (void)setStatsCollector:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_statsCollector, a3);
  context = self->_context;
  id v7 = (void *)context[67];
  context[67] = v5;
}

- (id)viewStateForNode:(id)a3 binding:(id)a4
{
  return TUI::Evaluation::Context::viewStateForNode((uint64_t)self->_context, a3.var0, *(_DWORD *)&a4);
}

- (void)defineBindingWithName:(id)a3 value:(id)a4
{
  id v7 = (objc_object *)a4;
  if (TUINameIsValid(*(_DWORD *)&a3))
  {
    Entry v6 = (Entry)a3;
    TUI::Evaluation::Context::pushBinding((TUI::Evaluation::Context *)self->_context, v6, v7);
  }
}

- (void)defineComponentBindingWithName:(id)a3 value:(id)a4
{
  id v7 = a4;
  if (TUINameIsValid(*(_DWORD *)&a3))
  {
    Entry v6 = (Entry)a3;
    TUI::Evaluation::Context::defineComponentBinding((uint64_t)self->_context, v6, v7);
  }
}

- (void)defineConstantWithName:(id)a3 value:(id)a4
{
  if (TUINameIsValid(*(_DWORD *)&a3) && TUIValueNotNil(a4.var0))
  {
    context = (TUI::Instruction::Evaluation **)self->_context;
    TUI::Evaluation::Context::pushConstant(context, *(_DWORD *)&a3, (TUI::Instruction::Decoder *)a4.var0);
  }
}

- (void)defineBool:(BOOL)a3 withName:(id)a4
{
  if (TUINameIsValid(*(_DWORD *)&a4))
  {
    context = (TUI::Evaluation::Context *)self->_context;
    v9._kind = 12;
    v9._object = 0;
    v9.var0._BOOL = a3;
    Entry v8 = (Entry)a4;
    TUI::Evaluation::Context::pushConstant(context, v8, &v9);
  }
}

- (void)defineLet:(id)a3 closure:(id)a4
{
  unint64_t var0 = a3.var0.var0;
  if (TUIDefinitionNotNil(a3.var0.var0) && TUIValueNotNil(a3.var1.var0))
  {
    context = (TUI::Instruction::Evaluation **)self->_context;
    Entry v8 = context[72];
    if (*((void *)v8 + 23) > var0)
    {
      ResolvedValue v9 = (unsigned __int16 *)(*((void *)v8 + 22) + 12 * var0);
      if (v9)
      {
        int v10 = v9[1];
        uint64_t v11 = v9[2];
        if (v11 != 0xFFFF && v10 != 0xFFFF)
        {
          unsigned int v13 = v10 | (v11 << 16);
          int v14 = *v9;
          if (*v9)
          {
            if (v14 == 2)
            {
              if (*((_DWORD *)v9 + 2) != -1)
              {
                TUI::Evaluation::Context::pushFunction((uint64_t)context, a3.var0.var0);
              }
            }
            else if (v14 == 1)
            {
              TUI::Evaluation::Context::pushNamedElement(context, v13, (TUI::Instruction::Decoder *)HIDWORD(*(unint64_t *)&a3));
            }
          }
          else
          {
            TUI::Evaluation::Context::pushConstant(context, v13, (TUI::Instruction::Decoder *)HIDWORD(*(unint64_t *)&a3));
          }
        }
      }
    }
  }
}

- (void)defineElement:(id)a3 closure:(id)a4
{
  if (TUIDefinitionNotNil(a3.var0.var0) && TUIElementNodeNotNil(a3.var1.var0))
  {
    context = self->_context;
    TUI::Evaluation::Context::pushDefinedElement(context, a3.var0.var0);
  }
}

- (void)defineStyle:(id *)a3 closure:(id)a4
{
  context = (uint64_t *)self->_context;
  $37BEA69CB2A2744B1AE9B34F7442AF12 v5 = *a3;
  TUI::Evaluation::Context::pushStyle(context, (int *)&v5);
}

- (void)defineAnimation:(id)a3 closure:(id)a4
{
}

- (id)instantiateAnimationReference:(id)a3
{
  return TUI::Evaluation::Context::instantiateAnimationReference((void *)self->_context, *(void *)&a3);
}

- (void)instantiateElementReference:(id)a3 withChildrenOfNode:(id)a4
{
}

- (void)instantiateNamedElementReference:(id)a3
{
}

- (id)dynamicStateForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(TUIManager *)self->_manager dynamicRegistry];
  unint64_t v12 = [v11 stateProviderForKind:v8];

  unsigned int v13 = [v12 dynamicStateForKind:v8 instance:v9 parameters:v10];
  if (v13)
  {
    capture = self->_capture;
    if (capture) {
      [(TUIInstantiateCapturing *)capture captureDynamicState:v13 forKind:v8 instance:v9 parameters:v10];
    }
  }

  return v13;
}

- (void)useGlobalsWithName:(id)a3
{
}

- (void)instantiateComponentWithReference:(id)a3 withChildrenOfNode:(id)a4
{
}

- (void)updateComponentBody:(id)a3
{
}

- (BOOL)updateComponentGlobals:(id)a3
{
  return TUI::Evaluation::Context::updateComponentGlobalsIfNeeded((TUI::Evaluation::Context *)self->_context, (TUIComponent *)a3);
}

- (void)instantiateRender:(id)a3 withChildrenOfNode:(id)a4
{
}

- (id)componentViewStateWithName:(id)a3
{
  return TUI::Evaluation::Context::componentViewStateWithName((uint64_t)self->_context, *(_DWORD *)&a3);
}

- (id)_xpathForLocation:(id)a3
{
  __int16 var0 = a3.var0;
  unint64_t v5 = a3.var0;
  if (TUILocationNotNil(a3.var0))
  {
    Entry v6 = (const TUI::Package::Buffer *)*((void *)self->_context + 72);
    if (*((void *)v6 + 17) > v5 >> 12 && (id v7 = (unsigned __int16 *)(*((void *)v6 + 16) + 8 * (v5 >> 12))) != 0)
    {
      uint64_t v8 = *v7;
      unint64_t v9 = (unint64_t)*((unsigned int *)v7 + 1) << 32;
      uint64_t v10 = v8 << 16;
    }
    else
    {
      unint64_t v9 = 0xFFFFFFFF00000000;
      uint64_t v10 = 4294901760;
    }
    unint64_t v13 = v9 | v10 | var0 & 0xFFF;
    uint64_t v11 = TUI::Package::Location::Entry::description((TUI::Package::Location::Entry *)&v13, v6);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)unresolvedValueForAttribute:(unsigned __int16)a3 node:(id)a4
{
  context = self->_context;
  unsigned __int16 v7 = a3;
  if (a3 == 0xFFFF) {
    goto LABEL_5;
  }
  if (a3 >= 0x100u) {
    sub_8CCD0("bitset test argument out of range");
  }
  if (((*(void *)((char *)context + (((unint64_t)a3 >> 3) & 0x1FF8) + 248) >> a3) & 1) == 0) {
LABEL_5:
  }
    unint64_t v5 = ($738B17BD11CC339B30296C0EA03CEC2B *)&TUIValueNil;
  else {
    unint64_t v5 = ($738B17BD11CC339B30296C0EA03CEC2B *)sub_12E50(context + 39, &v7) + 5;
  }
  return ($738B17BD11CC339B30296C0EA03CEC2B)v5->var0;
}

- ($7E080378D8F67055EE0984892F39872B)propertyNameForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:a3 node:a4.var0];
  context = self->_context;

  return ($7E080378D8F67055EE0984892F39872B)TUI::Instruction::Decoder::propertyName(v5, (uint64_t)context, v6);
}

- (const)_resolvedValueForAttribute:(unsigned __int16)a3 node:(id)a4
{
  context = self->_context;
  unsigned __int16 v6 = a3;
  if (a3 == 0xFFFF) {
    return 0;
  }
  if (a3 >= 0x100u) {
    sub_8CCD0("bitset test argument out of range");
  }
  if (((*(void *)((char *)context + (((unint64_t)a3 >> 3) & 0x1FF8) + 280) >> a3) & 1) == 0) {
    return 0;
  }
  else {
    return (const ResolvedValue *)(sub_12E50(context + 44, &v6) + 3);
  }
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)lengthForAttribute:(SEL)a3 node:(unsigned __int16)a4
{
  unsigned __int16 v6 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a4 node:a5.var0];
  if (v6) {
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUI::Evaluation::ResolvedValue::lengthValue((id *)v6, (const TUI::Evaluation::Context *)self->_context);
  }
  else {
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
  }
}

- (UIEdgeInsets)insetsForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a4.var0];
  if (v5)
  {
    double top = TUI::Evaluation::ResolvedValue::insetsValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)insetsForAttribute:(unsigned __int16)a3 withDefault:(UIEdgeInsets)a4 node:(id)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  uint64_t v10 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a5.var0];
  if (v10)
  {
    CGFloat top = TUI::Evaluation::ResolvedValue::insetsValue((id *)v10, (const TUI::Evaluation::Context *)self->_context);
    CGFloat left = v11;
    CGFloat bottom = v12;
    CGFloat right = v13;
  }
  double v14 = top;
  double v15 = left;
  double v16 = bottom;
  double v17 = right;
  result.CGFloat right = v17;
  result.CGFloat bottom = v16;
  result.CGFloat left = v15;
  result.CGFloat top = v14;
  return result;
}

- (double)floatForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a4.var0];
  if (!v5) {
    return 0.0;
  }
  context = (const TUI::Evaluation::Context *)self->_context;

  return TUI::Evaluation::ResolvedValue::floatValue((TUI::Evaluation::ResolvedValue *)v5, context);
}

- (double)floatForAttribute:(unsigned __int16)a3 withDefault:(double)a4 node:(id)a5
{
  unsigned __int16 v7 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a5.var0];
  if (!v7) {
    return a4;
  }
  context = (const TUI::Evaluation::Context *)self->_context;

  return TUI::Evaluation::ResolvedValue::floatValue((TUI::Evaluation::ResolvedValue *)v7, context);
}

- (int64_t)integerForAttribute:(unsigned __int16)a3 withDefault:(int64_t)a4 node:(id)a5
{
  unsigned __int16 v7 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a5.var0];
  if (!v7) {
    return a4;
  }
  context = (const TUI::Evaluation::Context *)self->_context;

  return TUI::Evaluation::ResolvedValue::integerValue((TUI::Evaluation::ResolvedValue *)v7, context);
}

- (unint64_t)unsignedIntegerForAttribute:(unsigned __int16)a3 withDefault:(unint64_t)a4 node:(id)a5
{
  unsigned __int16 v7 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a5.var0];
  if (!v7) {
    return a4;
  }
  context = (const TUI::Evaluation::Context *)self->_context;

  return TUI::Evaluation::ResolvedValue::integerValue((TUI::Evaluation::ResolvedValue *)v7, context);
}

- (CGSize)sizeForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a4.var0];
  if (v5)
  {
    double width = TUI::Evaluation::ResolvedValue::sizeValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)colorForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a4.var0];
  if (v5)
  {
    TUI::Evaluation::ResolvedValue::colorValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
    unint64_t v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)colorArrayForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a4.var0];
  if (v5)
  {
    TUI::Evaluation::ResolvedValue::colorArrayValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
    unint64_t v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)stringArrayForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a4.var0];
  if (v5)
  {
    TUI::Evaluation::ResolvedValue::stringArrayValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
    unint64_t v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)stringForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a4.var0];
  if (v5)
  {
    TUI::Evaluation::ResolvedValue::stringValue((TUI::Evaluation::ResolvedValue *)v5, (TUI::Symbol::Tab **)self->_context);
    unint64_t v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)BOOLForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a4.var0];
  if (v5)
  {
    context = (const TUI::Evaluation::Context *)self->_context;
    LOBYTE(v5) = TUI::Evaluation::ResolvedValue::BOOLValue((TUI::Evaluation::ResolvedValue *)v5, context);
  }
  return (char)v5;
}

- (BOOL)BOOLForAttribute:(unsigned __int16)a3 withDefault:(BOOL)a4 node:(id)a5
{
  unsigned __int16 v7 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a5.var0];
  if (!v7) {
    return a4;
  }
  context = (const TUI::Evaluation::Context *)self->_context;

  return TUI::Evaluation::ResolvedValue::BOOLValue((TUI::Evaluation::ResolvedValue *)v7, context);
}

- (id)objectForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a3 node:a4.var0];
  if (v5)
  {
    TUI::Evaluation::ResolvedValue::objectValue((TUI::Evaluation::ResolvedValue *)v5, (TUI::Symbol::Tab **)self->_context);
    unint64_t v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (CGAffineTransform)transformForAttribute:(SEL)a3 node:(unsigned __int16)a4
{
  CGSize result = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a4 node:a5.var0];
  if (result)
  {
    context = (const TUI::Evaluation::Context *)self->_context;
    TUI::Evaluation::ResolvedValue::transformValue((TUI::Evaluation::ResolvedValue *)result, context, retstr);
  }
  else
  {
    long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  return result;
}

- ($4AC7F32B1C626A3A04933030E84D26E0)springTimingParametersForAttribute:(SEL)a3 node:(unsigned __int16)a4
{
  CGSize result = [(TUIInstantiateContext *)self _resolvedValueForAttribute:a4 node:a5.var0];
  if (result)
  {
    context = (const TUI::Evaluation::Context *)self->_context;
    TUI::Evaluation::ResolvedValue::springTimingParameters((id *)result, context, (uint64_t)retstr);
  }
  else
  {
    *(_OWORD *)&retstr->__int16 var0 = TUISpringTimingParametersZero;
    *(_OWORD *)&retstr->var2 = unk_243500;
    retstr->var3.dy = 0.0;
  }
  return result;
}

- (unint64_t)animationCalculationModeAndCurveForNode:(id)a3
{
  uint64_t var0 = a3.var0;
  unint64_t v5 = [(TUIInstantiateContext *)self stringForAttribute:64 node:a3.var0];
  if ([v5 isEqualToString:@"ease-in-out"])
  {
    unint64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"ease-in"])
  {
    unint64_t v6 = 0x10000;
  }
  else if ([v5 isEqualToString:@"ease-out"])
  {
    unint64_t v6 = 0x20000;
  }
  else if ([v5 isEqualToString:@"linear"])
  {
    unint64_t v6 = 196608;
  }
  else if ([v5 isEqualToString:@"sigmoid"])
  {
    unint64_t v6 = 0x40000;
  }
  else
  {
    unint64_t v6 = 0;
  }
  unsigned __int16 v7 = [(TUIInstantiateContext *)self stringForAttribute:46 node:var0];
  if (([v7 isEqualToString:@"linear"] & 1) == 0)
  {
    if ([v7 isEqualToString:@"discrete"])
    {
      v6 |= 0x400uLL;
    }
    else if ([v7 isEqualToString:@"paced"])
    {
      v6 |= 0x800uLL;
    }
    else if ([v7 isEqualToString:@"cubic"])
    {
      v6 |= 0xC00uLL;
    }
    else if ([v7 isEqualToString:@"cubic-paced"])
    {
      v6 |= 0x1000uLL;
    }
  }

  return v6;
}

- (id)guidesForNode:(id)a3
{
  uint64_t var0 = a3.var0;
  unint64_t v5 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:121 node:a3.var0];
  unint64_t v6 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:207 node:var0];
  unsigned __int16 v7 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:205 node:var0];
  uint64_t v8 = [(TUIInstantiateContext *)self _resolvedValueForAttribute:43 node:var0];
  if (v5)
  {
    TUI::Evaluation::ResolvedValue::guideValue((id *)v5, (const TUI::Evaluation::Context *)self->_context);
    unint64_t v5 = (ResolvedValue *)objc_claimAutoreleasedReturnValue();
  }
  if (v6)
  {
    TUI::Evaluation::ResolvedValue::guideValue((id *)v6, (const TUI::Evaluation::Context *)self->_context);
    unint64_t v6 = (ResolvedValue *)objc_claimAutoreleasedReturnValue();
  }
  if (v7)
  {
    TUI::Evaluation::ResolvedValue::guideValue((id *)v7, (const TUI::Evaluation::Context *)self->_context);
    unsigned __int16 v7 = (ResolvedValue *)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
  {
    long long v9 = TUI::Evaluation::ResolvedValue::guideValue((id *)v8, (const TUI::Evaluation::Context *)self->_context);
    if (v5) {
      goto LABEL_15;
    }
  }
  else
  {
    long long v9 = 0;
    if (v5) {
      goto LABEL_15;
    }
  }
  if (!v6 && !v7 && !v9)
  {
    uint64_t v10 = 0;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = [[TUIGuides alloc] initWithLeading:v5 trailing:v6 top:v7 bottom:v9];
LABEL_16:

  return v10;
}

- (id)fontSpecForNode:(id)a3
{
  return TUI::Evaluation::Context::fontSpecForNode((uint64_t)self->_context);
}

- (id)pointerForNode:(id)a3
{
  return TUI::Evaluation::Context::pointerForNode((uint64_t)self->_context);
}

- (id)snapForAttribute:(unsigned __int16)a3 node:(id)a4
{
  return TUI::Evaluation::Context::snapForAttribute((uint64_t)self->_context, a3);
}

- (id)pointerStyleForNode:(id)a3
{
  uint64_t v4 = objc_opt_class();
  context = (TUI::Symbol::Tab **)self->_context;
  unsigned __int16 v10 = 153;
  if ((*((unsigned char *)context + 299) & 2) != 0)
  {
    unsigned __int16 v7 = sub_12E50(context + 44, &v10);
    unint64_t v6 = TUI::Evaluation::ResolvedValue::objectValue((TUI::Evaluation::ResolvedValue *)(v7 + 3), context);
  }
  else
  {
    unint64_t v6 = 0;
  }
  uint64_t v8 = TUIDynamicCast(v4, v6);

  return v8;
}

- (id)focusStyleForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v6 = objc_opt_class();
  context = (TUI::Symbol::Tab **)self->_context;
  unsigned __int16 v12 = v4;
  if (v4 == 0xFFFF) {
    goto LABEL_5;
  }
  if (v4 >= 0x100) {
    sub_8CCD0("bitset test argument out of range");
  }
  if (((*(unint64_t *)((char *)context + (((unint64_t)v4 >> 3) & 0x1FF8) + 280) >> v4) & 1) == 0)
  {
LABEL_5:
    long long v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_12E50(context + 44, &v12);
    long long v9 = TUI::Evaluation::ResolvedValue::objectValue((TUI::Evaluation::ResolvedValue *)(v8 + 3), context);
  }
  unsigned __int16 v10 = TUIDynamicCast(v6, v9);

  return v10;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)elementReferenceForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:a3 node:a4.var0];
  context = self->_context;

  return ($738B17BD11CC339B30296C0EA03CEC2B)TUI::Instruction::Decoder::elementReference(v5, (uint64_t)context, v6);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)nameReferenceForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:a3 node:a4.var0];
  context = self->_context;

  return ($738B17BD11CC339B30296C0EA03CEC2B)TUI::Instruction::Decoder::nameReference(v5, (uint64_t)context, v6);
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)bindingNameForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:a3 node:a4.var0];
  context = self->_context;

  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)TUI::Instruction::Decoder::bindingName(v5, (uint64_t)context, v6);
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)constantNameForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:a3 node:a4.var0];
  context = self->_context;

  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)TUI::Instruction::Decoder::constantName(v5, (uint64_t)context, v6);
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)globalsNameForAttribute:(unsigned __int16)a3 node:(id)a4
{
  unint64_t v5 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:a3 node:a4.var0];
  context = self->_context;

  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)TUI::Instruction::Decoder::globalsName(v5, (uint64_t)context, v6);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)lookupUnconditionalAttribute:(unsigned __int16)a3 attributes:(id)a4
{
  v20.uint64_t var0 = 0;
  uint64_t var1 = a4.var1;
  if (a4.var1)
  {
    int v5 = a3;
    uint64_t v6 = 0;
    unsigned __int16 v7 = (void *)*((void *)self->_context + 72);
    uint64_t var0 = a4.var0;
    uint64_t v21 = a4.var1;
    do
    {
      if (v7[31] > (unint64_t)(v6 + var0) && (long long v9 = (unsigned __int16 *)(v7[30] + 8 * (v6 + var0))) != 0)
      {
        unint64_t v10 = *v9;
        uint64_t v11 = v7[60];
        if (v10 >= (v7[61] - v11) >> 1) {
          int v12 = 0xFFFF;
        }
        else {
          int v12 = *(unsigned __int16 *)(v11 + 2 * v10);
        }
        uint64_t v13 = v9[1];
        unint64_t v14 = *((unsigned int *)v9 + 1);
      }
      else
      {
        uint64_t v13 = 0;
        int v12 = 0xFFFF;
        unint64_t v14 = 0xFFFFFFFFLL;
      }
      if (v12 == v5 && v13)
      {
        uint64_t v15 = 12 * v14;
        while (1)
        {
          if (v7[29] <= v14)
          {
            double v17 = &TUIConditionNil;
            double v16 = &TUIValueNil;
          }
          else
          {
            double v16 = (int *)(v15 + v7[28]);
            double v17 = v16 + 1;
            if (!v16)
            {
              double v17 = &TUIConditionNil;
              double v16 = &TUIValueNil;
            }
          }
          unsigned int v18 = *v16;
          if (TUIConditionIsNil(*v17)) {
            break;
          }
          v15 += 12;
          ++v14;
          if (!--v13) {
            goto LABEL_22;
          }
        }
        v20.uint64_t var0 = v18;
LABEL_22:
        uint64_t var1 = v21;
      }
      ++v6;
    }
    while (v6 != var1);
  }
  return v20;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)closureForNode:(id)a3
{
  context = self->_context;
  uint64_t v4 = context[72];
  if (*(void *)(v4 + 216) <= (unint64_t)a3.var0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 208) + 28 * a3.var0;
  }
  return ($738B17BD11CC339B30296C0EA03CEC2B)TUI::Evaluation::Context::closureForElement((uint64_t)context, v5);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)unconditionalValueForAttribute:(unsigned __int16)a3 node:(id)a4
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)[(TUIInstantiateContext *)self unresolvedValueForAttribute:a3 node:a4.var0];
}

- ($0220C184157FC9E8AD112820945A9326)letDefinitionWithNameAttribute:(unsigned __int16)a3 valueAttribute:(unsigned __int16)a4 node:(id)a5
{
  uint64_t v5 = a4;
  uint64_t var0 = a5.var0;
  uint64_t v8 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:a3 node:a5.var0];
  unsigned int v10 = TUI::Instruction::Decoder::definition(v8, (uint64_t)self->_context, v9);
  unsigned int v11 = [(TUIInstantiateContext *)self unresolvedValueForAttribute:v5 node:var0];
  unsigned int v12 = TUILetDefinitionNil;
  unsigned int v13 = *(_DWORD *)algn_2DD56C;
  BOOL v14 = TUIDefinitionNotNil(v10);
  if (v14) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = v12;
  }
  if (v14) {
    uint64_t v16 = v11;
  }
  else {
    uint64_t v16 = v13;
  }
  return ($0220C184157FC9E8AD112820945A9326)(v15 | (v16 << 32));
}

- ($37BEA69CB2A2744B1AE9B34F7442AF12)styleDefinitionWithNode:(SEL)a3 nameAttribute:(id)a4 inheritAttribute:(unsigned __int16)a5
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  CGSize result = ($37BEA69CB2A2744B1AE9B34F7442AF12 *)[(TUIPackageInternal *)self->_package packageBuffer];
  if (*(void *)&result[9].var0.var0 > (unint64_t)a4.var0
    && (uint64_t v12 = *(void *)&result[8].var2.var0.var1 + 28 * a4.var0) != 0)
  {
    unsigned int v13 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:v7 node:a4.var0];
    unsigned int v15 = TUI::Instruction::Decoder::definition(v13, (uint64_t)self->_context, v14);
    *(_OWORD *)&retstr->var0.uint64_t var0 = TUIStyleDefinitionNil;
    *(void *)&retstr->var2.var0.uint64_t var1 = qword_2DD580;
    CGSize result = ($37BEA69CB2A2744B1AE9B34F7442AF12 *)TUIDefinitionNotNil(v15);
    if (result)
    {
      uint64_t v16 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:v6 node:a4.var0];
      CGSize result = ($37BEA69CB2A2744B1AE9B34F7442AF12 *)TUI::Instruction::Decoder::styleReference(v16, (uint64_t)self->_context, v17);
      retstr->var0.uint64_t var0 = v15;
      retstr->uint64_t var1 = ($5B0274039C15E806FA91EF6B5728B838)(*(unsigned int *)(v12 + 16) | ((unint64_t)*(unsigned __int16 *)(v12 + 2) << 32));
      retstr->var2 = ($0F674443F67B1BBEFA3E91226872A32D)result;
      retstr->var3.uint64_t var0 = *(_DWORD *)(v12 + 24);
    }
  }
  else
  {
    *(_OWORD *)&retstr->var0.uint64_t var0 = TUIStyleDefinitionNil;
    *(void *)&retstr->var2.var0.uint64_t var1 = qword_2DD580;
  }
  return result;
}

- ($0220C184157FC9E8AD112820945A9326)animationDefinitonWithNode:(id)a3 nameAttribute:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v7 = [(TUIPackageInternal *)self->_package packageBuffer];
  if (v7[27] > (unint64_t)a3.var0 && 28 * a3.var0 + v7[26])
  {
    unsigned int v10 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", v4);
    int v12 = TUI::Instruction::Decoder::definition(v10, (uint64_t)self->_context, v11);
    int v13 = TUIAnimationDefinitionNil;
    unsigned int v14 = dword_2DD58C;
    BOOL v15 = TUIDefinitionNotNil(v12);
    if (v15) {
      unsigned int v8 = v12;
    }
    else {
      unsigned int v8 = v13;
    }
    if (v15) {
      uint64_t var0 = a3.var0;
    }
    else {
      uint64_t var0 = v14;
    }
  }
  else
  {
    unsigned int v8 = TUIAnimationDefinitionNil;
    uint64_t var0 = dword_2DD58C;
  }
  return ($0220C184157FC9E8AD112820945A9326)(v8 | (unint64_t)(var0 << 32));
}

- ($0220C184157FC9E8AD112820945A9326)elementDefinitionWithNameAttribute:(unsigned __int16)a3 node:(id)a4
{
  uint64_t v5 = a3;
  uint64_t v7 = [(TUIPackageInternal *)self->_package packageBuffer];
  if (v7[27] > (unint64_t)a4.var0 && 28 * a4.var0 + v7[26])
  {
    int v10 = TUIElementDefinitionNil;
    unsigned int v11 = dword_2DD594;
    int v12 = (TUI::Instruction::Decoder *)-[TUIInstantiateContext unresolvedValueForAttribute:node:](self, "unresolvedValueForAttribute:node:", v5);
    int v14 = TUI::Instruction::Decoder::definition(v12, (uint64_t)self->_context, v13);
    BOOL v15 = TUIDefinitionNotNil(v14);
    if (v15) {
      unsigned int v8 = v14;
    }
    else {
      unsigned int v8 = v10;
    }
    if (v15) {
      uint64_t var0 = a4.var0;
    }
    else {
      uint64_t var0 = v11;
    }
  }
  else
  {
    unsigned int v8 = TUIElementDefinitionNil;
    uint64_t var0 = dword_2DD594;
  }
  return ($0220C184157FC9E8AD112820945A9326)(v8 | (unint64_t)(var0 << 32));
}

- ($738B17BD11CC339B30296C0EA03CEC2B)enumeratorWithAttribute:(unsigned __int16)a3 node:(id)a4
{
  uint64_t v5 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:a3 node:a4.var0];
  context = self->_context;

  return ($738B17BD11CC339B30296C0EA03CEC2B)TUI::Instruction::Decoder::enumerator(v5, (uint64_t)context, v6);
}

- ($0F674443F67B1BBEFA3E91226872A32D)animationReferenceForAttribute:(unsigned __int16)a3 node:(id)a4
{
  uint64_t v5 = (TUI::Instruction::Decoder *)[(TUIInstantiateContext *)self unresolvedValueForAttribute:a3 node:a4.var0];
  context = self->_context;

  return ($0F674443F67B1BBEFA3E91226872A32D)TUI::Instruction::Decoder::animationReference(v5, (uint64_t)context, v6);
}

- (id)baseURLForNode:(id)a3
{
  v3 = (void *)*((void *)self->_context + 72);
  if (v3[27] > (unint64_t)a3.var0
    && (uint64_t v4 = v3[26] + 28 * a3.var0) != 0
    && (unint64_t v5 = *(_DWORD *)(v4 + 24) & 0xFFF, v3[14] > v5)
    && (uint64_t v6 = v3[13]) != 0)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:v6 + *(unsigned int *)(v3[15] + 4 * v5)];
    unsigned int v8 = +[NSURL URLWithString:v7 relativeToURL:*v3];
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)includeTemplateWithURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = *((id *)self->_context + 95);
    uint64_t v6 = [v5 package];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = +[NSURLComponents componentsWithURL:v4 resolvingAgainstBaseURL:1];
      unsigned int v8 = [v7 path];
      long long v9 = [v8 stringByStandardizingPath];
      [v7 setPath:v9];

      int v10 = [v7 URL];
      unsigned int v11 = [v6 prebuiltTemplates];
      int v12 = [v11 objectForKeyedSubscript:v10];

      if (v12)
      {
        TUI::Evaluation::Context::includeTemplate((uint64_t)self->_context, v12);
      }
      else
      {
        int v13 = TUIInstantiationLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
          BOOL v15 = [v4 absoluteURL];
          uint64_t v16 = [v6 url];
          int v17 = 134218498;
          unint64_t v18 = uniqueIdentifier;
          __int16 v19 = 2114;
          $738B17BD11CC339B30296C0EA03CEC2B v20 = v15;
          __int16 v21 = 2114;
          unint64_t v22 = v16;
          _os_log_error_impl(&def_141F14, v13, OS_LOG_TYPE_ERROR, "[fid:%lu] failed to find template: %{public}@ in package: %{public}@", (uint8_t *)&v17, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v7 = TUIInstantiationLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1912FC((uint64_t)self, v7);
      }
    }
  }
  else
  {
    [(TUIInstantiateContext *)self reportError:1001];
  }
}

- (unint64_t)childCountForNode:(id)a3
{
  uint64_t v3 = *((void *)self->_context + 72);
  if (*(void *)(v3 + 216) > (unint64_t)a3.var0 && (uint64_t v4 = *(void *)(v3 + 208) + 28 * a3.var0) != 0) {
    return *(unsigned __int16 *)(v4 + 4);
  }
  else {
    return 0;
  }
}

- (BOOL)recordErrors
{
  return *((unsigned char *)self->_context + 552);
}

- (void)setRecordErrors:(BOOL)a3
{
  *((unsigned char *)self->_context + 552) = a3;
}

- (id)environmentChildContainersForContainer:(id)a3
{
  uint64_t v3 = TUI::Evaluation::Context::environmentChildContainersForContainer((uint64_t)self->_context, (uint64_t)a3);

  return v3;
}

- (id)environmentContainersUsingGlobals
{
  return [*((id *)self->_context + 93) objectEnumerator];
}

- (void)usedDynamicColor
{
  *((void *)self->_context + 74) |= 0x10uLL;
}

- (void)enumerateChildrenOfNode:(id)a3 block:(id)a4
{
  unsigned int v8 = (void (**)(id, void))a4;
  unint64_t v6 = TUI::Evaluation::Context::childrenOfNode((uint64_t)self->_context, a3.var0);
  if ((v6 & 0xFFFF00000000) != 0)
  {
    uint64_t v7 = WORD2(v6);
    do
    {
      if (TUI::Evaluation::Context::evaluateCconditionForNode((const TUI::Evaluation::Context *)self->_context, v6))v8[2](v8, v6); {
      ++v6;
      }
      --v7;
    }
    while (v7);
  }
}

- (id)evaluateStringForAttribute:(unsigned __int16)a3 node:(id)a4
{
  int v7 = 0;
  id v8 = 0;
  if (TUI::Evaluation::Context::evaluateAttributeForNode((uint64_t)self->_context, a3, a4.var0, (uint64_t)&v7))
  {
    id v5 = TUI::Evaluation::ResolvedValue::stringValue((TUI::Evaluation::ResolvedValue *)&v7, (TUI::Symbol::Tab **)self->_context);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)instantiateNode:(id)a3 withBuilder:(id)a4
{
}

- (void)evaluateStates:(id)a3 block:(id)a4
{
}

- ($5B0274039C15E806FA91EF6B5728B838)childrenForNode:(id)a3
{
  return ($5B0274039C15E806FA91EF6B5728B838)TUI::Evaluation::Context::childrenOfNode((uint64_t)self->_context, a3.var0);
}

- (id)debugDumpEnvironmentContainerStructure:(id)a3
{
  uint64_t v3 = TUI::Evaluation::Context::debugDumpEnvironmentContainerStructure((uint64_t)self->_context, a3);

  return v3;
}

- (void)defineStruct:(id)a3 withName:(id)a4
{
}

- (id)structForAttribute:(unsigned __int16)a3 node:(id)a4
{
  context = self->_context;
  unsigned __int16 v9 = a3;
  if (a3 == 0xFFFF) {
    goto LABEL_5;
  }
  if (a3 >= 0x100u) {
    sub_8CCD0("bitset test argument out of range");
  }
  if (((*(void *)((char *)context + (((unint64_t)a3 >> 3) & 0x1FF8) + 280) >> a3) & 1) == 0)
  {
LABEL_5:
    int v7 = 0;
  }
  else
  {
    unint64_t v6 = sub_12E50(context + 44, &v9);
    int v7 = TUI::Evaluation::ResolvedValue::structValue((id *)v6 + 3, (const TUI::Evaluation::Context *)self->_context);
  }

  return v7;
}

- (void)resetInstantiationStats:(BOOL)a3
{
}

- (TUIManager)manager
{
  return self->_manager;
}

- (TUIInstantiateContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIInstantiateContextDelegate *)WeakRetained;
}

- (TUIIdentifierMap)identifierMap
{
  return self->_identifierMap;
}

- (TUIEnvironment)environment
{
  return self->_environment;
}

- (TUIActionHandlerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (TUIActionHandlerDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (TUIDynamicControlling)dynamicController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicController);

  return (TUIDynamicControlling *)WeakRetained;
}

- (void)setDynamicController:(id)a3
{
}

- (TUITransactionCoordinating)transactionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionCoordinator);

  return (TUITransactionCoordinating *)WeakRetained;
}

- (void)setTransactionCoordinator:(id)a3
{
}

- (TUIInstantiateCapturing)capture
{
  return self->_capture;
}

- (void)setCapture:(id)a3
{
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (TUIStatsEventCollector)statsCollector
{
  return self->_statsCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsCollector, 0);
  objc_storeStrong((id *)&self->_capture, 0);
  objc_destroyWeak((id *)&self->_transactionCoordinator);
  objc_destroyWeak((id *)&self->_dynamicController);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_package, 0);
}

@end