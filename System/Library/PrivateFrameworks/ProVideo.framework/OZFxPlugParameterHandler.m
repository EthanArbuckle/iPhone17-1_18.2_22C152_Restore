@interface OZFxPlugParameterHandler
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToFigTime:(SEL)a3 meOffset:(double)a4 motionEffect:(double)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fxTimeToFigTime:(SEL)a3 withConversionData:(id)a4;
- ($EBBD99E4BEE052F512DA5DADC73F537E)figDurationToFxDuration:(id *)a3 withConversionData:(void *)a4;
- ($EBBD99E4BEE052F512DA5DADC73F537E)figTimeToFxTime:(id *)a3 withConversionData:(void *)a4;
- (BOOL)_floatParameter:(int)a3 hasValidMin:(double)a4 max:(double)a5 sliderMin:(double)a6 sliderMax:(double)a7 defaultValue:(double)a8 paramFlags:(unsigned int)a9;
- (BOOL)_getAngle:(double *)a3 fromParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_getBoolValue:(BOOL *)a3 fromParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_getCustomParameterValue:(id *)a3 fromParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_getFloatValue:(double *)a3 fromParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_getGradientSamples:(void *)a3 numSamples:(unint64_t)a4 depth:(unint64_t)a5 fromParm:(unsigned int)a6 atTime:(id)a7;
- (BOOL)_getHistogramBlackIn:(double *)a3 BlackOut:(double *)a4 WhiteIn:(double *)a5 WhiteOut:(double *)a6 Gamma:(double *)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(id)a10;
- (BOOL)_getIntValue:(int *)a3 fromParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_getPathID:(void *)a3 fromParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 alphaValue:(double *)a6 fromParm:(unsigned int)a7 atTime:(id)a8;
- (BOOL)_getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 fromParm:(unsigned int)a6 atTime:(id)a7;
- (BOOL)_getXValue:(double *)a3 YValue:(double *)a4 fromParm:(unsigned int)a5 atTime:(id)a6;
- (BOOL)_intParameter:(int)a3 hasValidMin:(int)a4 max:(int)a5 sliderMin:(int)a6 sliderMax:(int)a7 defaultValue:(int)a8 paramFlags:(unsigned int)a9;
- (BOOL)_setBoolValue:(BOOL)a3 toParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_setCustomParameterValue:(id)a3 toParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_setFloatValue:(double)a3 toParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_setHistogramBlackIn:(double)a3 BlackOut:(double)a4 WhiteIn:(double)a5 WhiteOut:(double)a6 Gamma:(double)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(id)a10;
- (BOOL)_setIntValue:(int)a3 toParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_setPathID:(void *)a3 toParm:(unsigned int)a4 atTime:(id)a5;
- (BOOL)_setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 alphaValue:(double)a6 toParm:(unsigned int)a7 atTime:(id)a8;
- (BOOL)_setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 toParm:(unsigned int)a6 atTime:(id)a7;
- (BOOL)_setXValue:(double)a3 YValue:(double)a4 toParm:(unsigned int)a5 atTime:(id)a6;
- (BOOL)_setupRenderer;
- (BOOL)add2DScaleWithName:(id)a3 parmId:(unsigned int)a4 defaultX:(double)a5 defaultY:(double)a6 parmFlags:(unsigned int)a7;
- (BOOL)add2DVectorWithName:(id)a3 parmId:(unsigned int)a4 defaultX:(double)a5 defaultY:(double)a6 parmFlags:(unsigned int)a7;
- (BOOL)addAngleSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(double)a5 parameterMin:(double)a6 parameterMax:(double)a7 parmFlags:(unsigned int)a8;
- (BOOL)addColorParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultRed:(double)a5 defaultGreen:(double)a6 defaultBlue:(double)a7 defaultAlpha:(double)a8 parmFlags:(unsigned int)a9;
- (BOOL)addColorParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultRed:(double)a5 defaultGreen:(double)a6 defaultBlue:(double)a7 parmFlags:(unsigned int)a8;
- (BOOL)addCustomParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(id)a5 parmFlags:(unsigned int)a6;
- (BOOL)addFlags:(unsigned int)a3 toParm:(unsigned int)a4;
- (BOOL)addFloatSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(double)a5 parameterMin:(double)a6 parameterMax:(double)a7 sliderMin:(double)a8 sliderMax:(double)a9 delta:(double)a10 parmFlags:(unsigned int)a11;
- (BOOL)addGradientPositionedWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5;
- (BOOL)addGradientWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5;
- (BOOL)addHistogramWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5;
- (BOOL)addImageReferenceWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5;
- (BOOL)addIntSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(int)a5 parameterMin:(int)a6 parameterMax:(int)a7 sliderMin:(int)a8 sliderMax:(int)a9 delta:(int)a10 parmFlags:(unsigned int)a11;
- (BOOL)addLevelsWithName:(id)a3 parmId:(unsigned int)a4 hideGamma:(BOOL)a5 parmFlags:(unsigned int)a6;
- (BOOL)addPathPickerWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5;
- (BOOL)addPercentSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(double)a5 parameterMin:(double)a6 parameterMax:(double)a7 sliderMin:(double)a8 sliderMax:(double)a9 delta:(double)a10 parmFlags:(unsigned int)a11;
- (BOOL)addPointParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultX:(double)a5 defaultY:(double)a6 parmFlags:(unsigned int)a7;
- (BOOL)addPopupMenuWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(unsigned int)a5 menuEntries:(id)a6 parmFlags:(unsigned int)a7;
- (BOOL)addPopupMenuWithNameAndTags:(id)a3 parmId:(unsigned int)a4 defaultValue:(unsigned int)a5 menuEntries:(id)a6 tags:(const int *)a7 tagCount:(int)a8 parmFlags:(unsigned int)a9;
- (BOOL)addStringParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(id)a5 parmFlags:(unsigned int)a6;
- (BOOL)addToggleButtonWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(BOOL)a5 parmFlags:(unsigned int)a6;
- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4;
- (BOOL)containsParameterWithID:(unsigned int)a3;
- (BOOL)doneAddingParams;
- (BOOL)endParameterSubGroup;
- (BOOL)endUndoGroup;
- (BOOL)finalizeImage:(id)a3 withSceneNode:(void *)a4 pixelBounds:(PCRect<int>)a5 agent:(void *)a6 andRenderParams:(const void *)a7 atTime:(id)a8;
- (BOOL)folderWasModified:(void *)a3 inDocument:(void *)a4 parameterID:(unsigned int)a5 modifiedParamID:(void *)a6 supportsParametersChanged:(BOOL)a7 paramsChangedArray:(id)a8 target:(id)a9;
- (BOOL)getAnalysisTexture:(id *)a3 requestInfo:(id *)a4 fromParm:(unsigned int)a5 atFxTime:(id)a6;
- (BOOL)getBitmap:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(double)a8;
- (BOOL)getBoolValue:(BOOL *)a3 fromParm:(unsigned int)a4 atTime:(double)a5;
- (BOOL)getCustomParameterValue:(id *)a3 fromParm:(unsigned int)a4;
- (BOOL)getCustomParameterValue:(id *)a3 fromParm:(unsigned int)a4 atTime:(double)a5;
- (BOOL)getFloatValue:(double *)a3 fromParm:(unsigned int)a4 atTime:(double)a5;
- (BOOL)getGradientSamples:(void *)a3 numSamples:(unint64_t)a4 depth:(unint64_t)a5 fromParm:(unsigned int)a6 atTime:(double)a7;
- (BOOL)getGradientStartEnd:(double *)a3 startY:(double *)a4 endX:(double *)a5 endY:(double *)a6 type:(int *)a7 fromParm:(unsigned int)a8 atTime:(id)a9;
- (BOOL)getHeliumImage:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(id)a8;
- (BOOL)getHistogramBlackIn:(double *)a3 BlackOut:(double *)a4 WhiteIn:(double *)a5 WhiteOut:(double *)a6 Gamma:(double *)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(double)a10;
- (BOOL)getIntValue:(int *)a3 fromParm:(unsigned int)a4 atTime:(double)a5;
- (BOOL)getLevelsBlack:(double *)a3 White:(double *)a4 Gamma:(double *)a5 fromParm:(unsigned int)a6 atTime:(id)a7;
- (BOOL)getParameterFlags:(unsigned int *)a3 fromParm:(unsigned int)a4;
- (BOOL)getPathID:(void *)a3 fromParm:(unsigned int)a4 atTime:(double)a5;
- (BOOL)getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 alphaValue:(double *)a6 fromParm:(unsigned int)a7 atTime:(double)a8;
- (BOOL)getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 fromParm:(unsigned int)a6 atTime:(double)a7;
- (BOOL)getStringParameterValue:(id *)a3 fromParm:(unsigned int)a4;
- (BOOL)getTexture:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(double)a8;
- (BOOL)getXValue:(double *)a3 YValue:(double *)a4 fromParm:(unsigned int)a5 atTime:(double)a6;
- (BOOL)hasPathParameters;
- (BOOL)hasPointParameters;
- (BOOL)hasValidParameterID:(int)a3 checkMix:(BOOL)a4 checkSpecialCheckboxIDs:(BOOL)a5;
- (BOOL)imageSize:(CGSize *)a3 fromParameter:(unsigned int)a4 atTime:(id *)a5;
- (BOOL)isColorCorrection;
- (BOOL)isImageWellMediaFlexoMediaForSceneNode:(void *)a3;
- (BOOL)isPerformingBulkChange;
- (BOOL)isRendering;
- (BOOL)parameter:(int)a3 hasValidFlags:(unsigned int)a4;
- (BOOL)removeFlags:(unsigned int)a3 fromParm:(unsigned int)a4;
- (BOOL)retrieveImage:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(id)a8 retriever:(SEL)a9 ARGB:(BOOL)a10 imageType:(unint64_t)a11 forAnalysis:(BOOL)a12;
- (BOOL)safeToSetParameters;
- (BOOL)setBoolValue:(BOOL)a3 toParm:(unsigned int)a4 atTime:(double)a5;
- (BOOL)setCustomParameterDefaultValue:(id)a3 parmId:(unsigned int)a4;
- (BOOL)setCustomParameterValue:(id)a3 toParm:(unsigned int)a4;
- (BOOL)setCustomParameterValue:(id)a3 toParm:(unsigned int)a4 atTime:(double)a5;
- (BOOL)setFloatValue:(double)a3 toParm:(unsigned int)a4 atTime:(double)a5;
- (BOOL)setGradientFlags:(BOOL)a3 toParam:(unsigned int)a4;
- (BOOL)setGradientHiddenWithOSC:(BOOL)a3 toParam:(unsigned int)a4;
- (BOOL)setGradientStartEnd:(double)a3 startY:(double)a4 endX:(double)a5 endY:(double)a6 toParm:(unsigned int)a7 atTime:(id)a8;
- (BOOL)setHistogramBlackIn:(double)a3 BlackOut:(double)a4 WhiteIn:(double)a5 WhiteOut:(double)a6 Gamma:(double)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(double)a10;
- (BOOL)setIntValue:(int)a3 toParm:(unsigned int)a4 atTime:(double)a5;
- (BOOL)setLevelsBlack:(double)a3 White:(double)a4 Gamma:(double)a5 forParm:(unsigned int)a6 atTime:(id)a7;
- (BOOL)setParameterFlags:(unsigned int)a3 toParm:(unsigned int)a4;
- (BOOL)setPathID:(void *)a3 toParm:(unsigned int)a4 atTime:(double)a5;
- (BOOL)setRedValue:(double)a3 GreenValue:(double)a4 BlueValue:(double)a5 AlphaValue:(double)a6 toParm:(unsigned int)a7 atTime:(double)a8;
- (BOOL)setRedValue:(double)a3 GreenValue:(double)a4 BlueValue:(double)a5 toParm:(unsigned int)a6 atTime:(double)a7;
- (BOOL)setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 alphaValue:(double)a6 toParm:(unsigned int)a7 atTime:(double)a8;
- (BOOL)setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 toParm:(unsigned int)a6 atTime:(double)a7;
- (BOOL)setStringParameterValue:(id)a3 toParm:(unsigned int)a4;
- (BOOL)setXValue:(double)a3 YValue:(double)a4 toParm:(unsigned int)a5 atTime:(double)a6;
- (BOOL)shouldFlipPoints;
- (BOOL)startParameterSubGroup:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5;
- (BOOL)startUndoGroup:(id)a3;
- (BOOL)suppressUpdates;
- (BOOL)useAbsolutePoints;
- (BOOL)useInputPoints;
- (BOOL)usesRationalTime;
- (GLRenderer)renderer;
- (OZChannelBase)channelForParameterID:(unsigned int)a3;
- (OZChannelBase)channelWithID:(int)a3;
- (OZChannelBase)parameterAtIndex:(unsigned int)a3;
- (OZChannelBool)absolutePointsChannel;
- (OZChannelBool)flipChannel;
- (OZChannelBool)inputPointsChannel;
- (OZChannelBool)publishOSCChannel;
- (OZChannelPercent)mixChannel;
- (OZFxPlugColorTransformInfo)getColorTransformInfo;
- (OZFxPlugParameterHandler)initWithBaseChannel:(void *)a3 andCopy:(id)a4 Skip:(int)a5 andPluginLock:(shared_ptr<OZFxPlugSharedLock>)a6;
- (OZFxPlugParameterHandler)initWithBaseChannel:(void *)a3 andCopy:(id)a4 andPluginLock:(shared_ptr<OZFxPlugSharedLock>)a5;
- (OZFxPlugParameterHandler)initWithBaseChannel:(void *)a3 andPluginLock:(shared_ptr<OZFxPlugSharedLock>)a4;
- (OZRenderState)getTempContextRenderState;
- (PCNSRef<FFMotionEffect)motionEffectRef;
- (PCPtr<LiImageSource>)makeSourceFromSceneNode:(void *)a3 withRenderParams:(void *)a4;
- (PCRect<double>)getBoundsFromSceneNode:(void *)a3 withRenderParams:(void *)a4;
- (double)convertFromFigTime:(id *)a3 meOffset:(double)a4 motionEffect:(id)a5;
- (double)getPixelAspectRatioFromSceneNode:(void *)a3;
- (double)mixAmountAtTime:(id)a3;
- (id).cxx_construct;
- (id)decodeLegacyData:(id)a3 forParameterID:(unsigned int)a4;
- (id)displayName;
- (id)getAllParameterValuesAtTime:(id *)a3 transactionID:(unint64_t)a4 pluginSessionID:(unint64_t)a5;
- (id)motionEffectForLockedSharedBase:(void *)a3;
- (id)transactionForParameterID:(unsigned int)a3 atTime:(id *)a4 transactionID:(unint64_t)a5 pluginSessionID:(unint64_t)a6;
- (int)numWriteActions;
- (unsigned)fxParameterFlagsForChannel:(OZChannelBase *)a3;
- (unsigned)paramIDForImageWellWithSceneNode:(unsigned int)a3;
- (unsigned)parameterCount;
- (vector<unsigned)imageParamIDs;
- (void)_updateUI:(id)a3;
- (void)_updateUIForParm:(int)a3;
- (void)abortAndWait;
- (void)actionEnded;
- (void)actionStarted;
- (void)addAbsolutePointCheckbox:(unsigned int)a3;
- (void)addExistingChannel:(OZChannelBase *)a3;
- (void)addExistingGroup:(void *)a3;
- (void)addFlipCheckbox:(unsigned int)a3;
- (void)addFlipCheckbox:(unsigned int)a3 withChannel:(OZChannelBool *)a4;
- (void)addInputPointsCheckbox:(unsigned int)a3;
- (void)addInputPointsCheckbox:(unsigned int)a3 withChannel:(OZChannelBool *)a4;
- (void)addMixSlider:(unsigned int)a3;
- (void)addMixSlider:(unsigned int)a3 withChannel:(OZChannelPercent *)a4;
- (void)addPublishOSCCheckbox:(unsigned int)a3;
- (void)appWillTerminate:(id)a3;
- (void)baseChannel;
- (void)beginTimingOperation:(id *)a3 forChannel:(OZChannelBase *)a4;
- (void)callParameterChanged:(id)a3 forParameterID:(unsigned int)a4 modifiedParameterIDs:(void *)a5 changedParameters:(id)a6 supportsParametersChanged:(BOOL)a7;
- (void)channelMap;
- (void)clearImageList;
- (void)contextManager;
- (void)copyFolderRecursiveFrom:(void *)a3 To:(void *)a4;
- (void)copyFolderRecursiveFrom:(void *)a3 To:(void *)a4 Skip:(int)a5;
- (void)copyValueGettersFrom:(id)a3;
- (void)customParameterList;
- (void)dealloc;
- (void)dumpAllChannels;
- (void)dumpChannelFolder:(void *)a3 depth:(int)a4;
- (void)forceRenderAtTime:(id)a3;
- (void)getColorInFxPlugColorSpace:(void *)a3 red:(float *)a4 green:(float *)a5 blue:(float *)a6 alpha:(float *)a7;
- (void)getFieldMode:(int *)a3 fromFootage:(void *)a4;
- (void)getLayerOffsetX:(double *)a3 andOffsetY:(double *)a4 fromSceneNode:(void *)a5 withRenderParams:(const void *)a6;
- (void)getPointChannel:(OZChannel *)a3 nearestPoint:(PCVector2<double>)a4 atTime:(id *)a5;
- (void)getScene;
- (void)getSceneNode;
- (void)markForDynamicParameterUsage;
- (void)movePublishOSCChannelToEnd;
- (void)onVTBUserInteractionEventNotification:(id)a3;
- (void)preGetCMTime:(id *)a3 forChannel:(OZChannelBase *)a4 atFxTime:(id)a5;
- (void)reAddHiddenParameters;
- (void)removeHiddenParameters;
- (void)removeParameter:(unsigned int)a3;
- (void)restoreParameterFlagsForChannel:(OZChannelBase *)a3;
- (void)saveParameterFlags;
- (void)sendNotifications:(id)a3;
- (void)sendUpdateEvent;
- (void)setAgent:(void *)a3 toScaleTo:(const void *)a4;
- (void)setColorCorrection:(BOOL)a3;
- (void)setColorFromFxPlugColorSpace:(void *)a3 red:(float)a4 green:(float)a5 blue:(float)a6 alpha:(float)a7;
- (void)setDoneAddingParams:(BOOL)a3;
- (void)setHandlingOSCEvents:(BOOL)a3;
- (void)setIsNewGradientColorize:(BOOL)a3;
- (void)setIsRendering:(BOOL)a3;
- (void)setParameterFlags:(unsigned int)a3 forChannel:(OZChannelBase *)a4;
- (void)setPluginRemoved:(BOOL)a3;
- (void)setRenderParams:(const void *)a3 withLithiumInput:(void *)a4 withLithiumAgent:(void *)a5;
- (void)setViewControllerGroup:(id)a3;
- (void)setupImageParamIDs:(void *)a3;
- (void)stopObservingViewControllerGroup;
- (void)updateChannelMap;
- (void)updateInspector;
- (void)updateInspectorAndDeleteChannel:(id)a3;
- (void)updateKeyframeEditor;
@end

@implementation OZFxPlugParameterHandler

- (void)dumpAllChannels
{
  {
    PCMutex::PCMutex(&-[OZFxPlugParameterHandler dumpAllChannels]::printLock);
    __cxa_atexit((void (*)(void *))PCMutex::~PCMutex, &-[OZFxPlugParameterHandler dumpAllChannels]::printLock, &dword_1B73F3000);
  }
  PCMutex::lock(&-[OZFxPlugParameterHandler dumpAllChannels]::printLock);
  LOBYTE(v3) = 1;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x1E4FBA250], (uint64_t)"\n----\n", 6);
  -[OZFxPlugParameterHandler dumpChannelFolder:depth:](self, "dumpChannelFolder:depth:", self->_baseChannel, 0, &-[OZFxPlugParameterHandler dumpAllChannels]::printLock, v3);
  PCMutex::unlock(&-[OZFxPlugParameterHandler dumpAllChannels]::printLock);
}

- (void)dumpChannelFolder:(void *)a3 depth:(int)a4
{
  if (a4 >= 1)
  {
    v7 = (void *)MEMORY[0x1E4FBA250];
    int v8 = a4;
    do
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"\t", 1);
      --v8;
    }
    while (v8);
  }
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x1E4FBA250], (uint64_t)"Folder ", 7);
  CStr = PCString::createCStr((PCString *)a3 + 4);
  if (CStr)
  {
    v11 = CStr;
    size_t v12 = strlen(CStr);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)v11, v12);
    free(v11);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)":\n", 2);
  v13 = (PCString ***)*((void *)a3 + 14);
  v15 = *v13;
  v14 = v13[1];
  if (*v13 != v14)
  {
    v16 = (void *)MEMORY[0x1E4FBA250];
    do
    {
      v17 = *v15;
      if ((BYTE1((*v15)[7].var0) & 0x10) != 0)
      {
      }
      else
      {
        int v18 = a4 + 1;
        if ((a4 & 0x80000000) == 0)
        {
          do
          {
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"\t", 1);
            --v18;
          }
          while (v18);
          v17 = *v15;
        }
        v19 = PCString::createCStr(v17 + 4);
        if (v19)
        {
          v20 = v19;
          size_t v21 = strlen(v19);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v20, v21);
          free(v20);
        }
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"\n", 1);
      }
      ++v15;
    }
    while (v15 != v14);
  }
}

- (OZFxPlugParameterHandler)initWithBaseChannel:(void *)a3 andPluginLock:(shared_ptr<OZFxPlugSharedLock>)a4
{
  v6.receiver = self;
  v6.super_class = (Class)OZFxPlugParameterHandler;
  v7 = a3;
  v4 = [(OZFxPlugParameterHandler *)&v6 init];
  if (v4)
  {
    v4->_viewControllerGroup = 0;
    operator new();
  }
  return 0;
}

- (OZFxPlugParameterHandler)initWithBaseChannel:(void *)a3 andCopy:(id)a4 andPluginLock:(shared_ptr<OZFxPlugSharedLock>)a5
{
  v7.receiver = self;
  v7.super_class = (Class)OZFxPlugParameterHandler;
  int v8 = a3;
  v5 = [(OZFxPlugParameterHandler *)&v7 init];
  if (v5)
  {
    v5->_viewControllerGroup = 0;
    operator new();
  }
  return 0;
}

- (OZFxPlugParameterHandler)initWithBaseChannel:(void *)a3 andCopy:(id)a4 Skip:(int)a5 andPluginLock:(shared_ptr<OZFxPlugSharedLock>)a6
{
  v8.receiver = self;
  v8.super_class = (Class)OZFxPlugParameterHandler;
  v9 = a3;
  objc_super v6 = [(OZFxPlugParameterHandler *)&v8 init];
  if (v6)
  {
    v6->_viewControllerGroup = 0;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  channelMap = (void **)self->_channelMap;
  v4 = channelMap + 1;
  v5 = *channelMap;
  if (*channelMap == channelMap + 1) {
    goto LABEL_22;
  }
  do
  {
    objc_super v6 = (uint64_t *)v5[5];
    if (v6)
    {
      uint64_t v7 = *v6;
      {
        goto LABEL_6;
      }
      (*(void (**)(uint64_t *))(v7 + 8))(v6);
    }
    v5[5] = 0;
LABEL_6:
    objc_super v8 = (void *)v5[1];
    if (v8)
    {
      do
      {
        v9 = v8;
        objc_super v8 = (void *)*v8;
      }
      while (v8);
    }
    else
    {
      do
      {
        v9 = (void *)v5[2];
        BOOL v10 = *v9 == (void)v5;
        v5 = v9;
      }
      while (!v10);
    }
    v5 = v9;
  }
  while (v9 != v4);
  channelMap = (void **)self->_channelMap;
  v11 = *channelMap;
  if (*channelMap != v4)
  {
    do
    {
      uint64_t v12 = v11[5];
      if (v12)
      {
        (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
        v11[5] = 0;
      }
      v13 = (void *)v11[1];
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = (void *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (void *)v11[2];
          BOOL v10 = *v14 == (void)v11;
          v11 = v14;
        }
        while (!v10);
      }
      v11 = v14;
    }
    while (v14 != v4);
    channelMap = (void **)self->_channelMap;
  }
LABEL_22:
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)channelMap, channelMap[1]);
  *channelMap = channelMap + 1;
  channelMap[2] = 0;
  channelMap[1] = 0;
  flagMap = (char *)self->_flagMap;
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)flagMap, *((void **)flagMap + 1));
  *(void *)flagMap = flagMap + 8;
  *((void *)flagMap + 2) = 0;
  *((void *)flagMap + 1) = 0;
  folderStack = self->_folderStack;
  if (folderStack)
  {
    uint64_t v18 = std::deque<unsigned long>::~deque[abi:ne180100](folderStack);
    MEMORY[0x1BA9BFBA0](v18, 0x1080C40BE8D5F09);
  }
  self->_folderStack = 0;
  v19 = (void **)self->_channelMap;
  if (v19)
  {
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)self->_channelMap, v19[1]);
    MEMORY[0x1BA9BFBA0](v19, 0x1020C4062D53EE8);
  }
  self->_channelMap = 0;
  renderer = (OZChannelBase *)self->_renderer;
  if (renderer)
  {
    uint64_t v21 = OZChannelBase::setRangeName(renderer, v16);
    MEMORY[0x1BA9BFBA0](v21, 0xC400A2AC0F1);
  }
  self->_renderer = 0;
  v22 = (void **)self->_flagMap;
  if (v22)
  {
    std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)self->_flagMap, v22[1]);
    MEMORY[0x1BA9BFBA0](v22, 0x1020C4062D53EE8);
  }
  self->_flagMap = 0;
  v23.receiver = self;
  v23.super_class = (Class)OZFxPlugParameterHandler;
  [(OZFxPlugParameterHandler *)&v23 dealloc];
}

- (void)appWillTerminate:(id)a3
{
  self->_appTerminating = 1;
}

- (void)setPluginRemoved:(BOOL)a3
{
}

- (void)copyFolderRecursiveFrom:(void *)a3 To:(void *)a4
{
}

- (void)copyFolderRecursiveFrom:(void *)a3 To:(void *)a4 Skip:(int)a5
{
  if (a3)
  {
    if (a4)
    {
      objc_super v6 = (uint64_t *)*((void *)a3 + 14);
      if (v6)
      {
        uint64_t v7 = *v6;
        objc_super v8 = *(const void ***)(*((void *)a3 + 14) + 8);
        uint64_t v9 = 8 * (a5 - 1) + 8;
        if (a5 <= 0) {
          uint64_t v9 = 0;
        }
        BOOL v10 = (const void **)(v7 + v9);
        if ((const void **)(v7 + v9) != v8)
        {
          p_end_cap = &self->_customParameterList.__end_cap_;
          p_customParameterList = &self->_customParameterList;
          do
          {
            uint64_t v12 = (OZChannelBase *)(*(uint64_t (**)(const void *, SEL))(*(void *)*v10 + 248))(*v10, a2);
            OZChannelFolder::push_back((OZChannelFolder *)a4, v12);
            channelMap = (uint64_t **)self->_channelMap;
            LODWORD(v46) = *((_DWORD *)*v10 + 6);
            v50[0] = &v46;
            std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, (unsigned int *)&v46, (uint64_t)&std::piecewise_construct, v50)[5] = (uint64_t *)v12;
            if (v12)
            {
              if (v14)
              {
                v15 = v14;
                v16 = [(OZFxPlugParameterHandler *)self getScene];
                cntrl = self->_fxPlugLock.__cntrl_;
                ptr = self->_fxPlugLock.__ptr_;
                v49 = cntrl;
                if (cntrl) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
                }
                OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v50, (uint64_t)&ptr);
                if (v49) {
                  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v49);
                }
                uint64_t v18 = *(void *)v50[0];
                uint64_t v46 = 0;
                v47 = 0;
                LODWORD(v46) = *((_DWORD *)v15 + 6);
                HIDWORD(v46) = (*(uint64_t (**)(uint64_t))(*(void *)v18 + 40))(v18);
                v47 = v16;
                OZChannelBlindData::setInterpolateContext(v15, (NSData *)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v46 length:16]);
                end = self->_customParameterList.__end_;
                value = self->_customParameterList.__end_cap_.__value_;
                if (end >= value)
                {
                  uint64_t v22 = end - p_customParameterList->__begin_;
                  if ((unint64_t)(v22 + 1) >> 61) {
                    std::vector<double>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v23 = (char *)value - (char *)p_customParameterList->__begin_;
                  uint64_t v24 = v23 >> 2;
                  if (v23 >> 2 <= (unint64_t)(v22 + 1)) {
                    uint64_t v24 = v22 + 1;
                  }
                  if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v25 = v24;
                  }
                  if (v25) {
                    v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)p_end_cap, v25);
                  }
                  else {
                    v26 = 0;
                  }
                  v27 = (OZChannelBlindData **)&v26[8 * v22];
                  *v27 = v15;
                  uint64_t v21 = v27 + 1;
                  begin = self->_customParameterList.__begin_;
                  v28 = self->_customParameterList.__end_;
                  if (v28 != begin)
                  {
                    do
                    {
                      v30 = *--v28;
                      *--v27 = v30;
                    }
                    while (v28 != begin);
                    v28 = p_customParameterList->__begin_;
                  }
                  self->_customParameterList.__begin_ = v27;
                  self->_customParameterList.__end_ = v21;
                  self->_customParameterList.__end_cap_.__value_ = (OZChannelBlindData **)&v26[8 * v25];
                  if (v28) {
                    operator delete(v28);
                  }
                }
                else
                {
                  *end = v15;
                  uint64_t v21 = end + 1;
                }
                self->_customParameterList.__end_ = v21;
                OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v50);
              }
              if (v31)
              {
                v32 = v31;
                v33 = self->_fxPlugLock.__cntrl_;
                v44 = self->_fxPlugLock.__ptr_;
                v45 = v33;
                if (v33) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)v33 + 1, 1uLL, memory_order_relaxed);
                }
                OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)v50, (uint64_t)&v44);
                if (v45) {
                  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v45);
                }
                uint64_t v34 = *(void *)v50[0];
                PCString::PCString(&v43, &v32->var20);
                v35.var0 = (__CFString *)&v43;
                OZChannelButton::setCallbackSelectorAsString(v32, v35, *(void **)(v34 + 24));
                PCString::~PCString(&v43);
                OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)v50);
              }
            }
            v36 = *v10;
            if (*v10)
            {
              if (v37)
              {
                if (!v38 && !v39)
                {
                  if (v12) {
                  else
                  }
                    v40 = 0;
                  -[OZFxPlugParameterHandler copyFolderRecursiveFrom:To:](self, "copyFolderRecursiveFrom:To:", v37, v40, p_end_cap);
                }
              }
            }
            ++v10;
          }
          while (v10 != v8);
        }
      }
    }
  }
}

- (void)setViewControllerGroup:(id)a3
{
  self->_viewControllerGroup = (OZViewControllerGroup *)a3;
}

- (void)stopObservingViewControllerGroup
{
  self->_viewControllerGroup = 0;
}

- (void)copyValueGettersFrom:(id)a3
{
  uint64_t v3 = (char *)*((void *)a3 + 4);
  v4 = (char *)a3 + 40;
  if (v3 != (char *)a3 + 40)
  {
    p_paramCreationMap = (uint64_t **)&self->_paramCreationMap;
    do
    {
      v11 = v3 + 32;
      objc_super v6 = std::__tree<std::__value_type<unsigned int,std::string>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::string>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(p_paramCreationMap, (unsigned int *)v3 + 8, (uint64_t)&std::piecewise_construct, &v11);
      long long v7 = *(_OWORD *)(v3 + 40);
      v6[7] = (uint64_t *)*((void *)v3 + 7);
      *(_OWORD *)(v6 + 5) = v7;
      objc_super v8 = (char *)*((void *)v3 + 1);
      if (v8)
      {
        do
        {
          uint64_t v9 = v8;
          objc_super v8 = *(char **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          uint64_t v9 = (char *)*((void *)v3 + 2);
          BOOL v10 = *(void *)v9 == (void)v3;
          uint64_t v3 = v9;
        }
        while (!v10);
      }
      uint64_t v3 = v9;
    }
    while (v9 != v4);
  }
}

- (void)clearImageList
{
  ImageList = (uint64_t *)OZFxPlugRenderContextManager::getImageList(&self->_threadContextManager);

  std::vector<std::shared_ptr<HGGPUComputeDevice const>>::__clear[abi:ne180100](ImageList);
}

- (void)getScene
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
  if (v2) {
    return 0;
  }
  baseChannel = (OZChannelBase *)self->_baseChannel;
  if (!baseChannel) {
    return 0;
  }
  uint64_t ObjectManipulator = OZChannelBase::getObjectManipulator(baseChannel);
  if (!ObjectManipulator) {
    return 0;
  }
  v5 = *(uint64_t (**)(void))(*(void *)ObjectManipulator + 264);

  return (void *)v5();
}

- (void)getSceneNode
{
  baseChannel = (OZChannelBase *)self->_baseChannel;
  if (!baseChannel) {
    return 0;
  }
  uint64_t ObjectManipulator = OZChannelBase::getObjectManipulator(baseChannel);
  if (!ObjectManipulator) {
    return 0;
  }
  v4 = *(uint64_t (**)(void))(*(void *)ObjectManipulator + 232);

  return (void *)v4();
}

- (id)motionEffectForLockedSharedBase:(void *)a3
{
  if (!a3) {
    return 0;
  }
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
  if (v3) {
    return 0;
  }
  else {
    return (id)TXParagraphStyleFolder_Factory::createInstance((TXParagraphStyleFolder_Factory *)a3, (OZFactoryBase *)a2);
  }
}

- (PCNSRef<FFMotionEffect)motionEffectRef
{
  v4 = v2;
  *unsigned __int8 v2 = 0;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v9 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v10, (uint64_t)&ptr);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9);
  }
  if (*(void *)v10[0])
  {
    PCMakeNSRefAndRetain<EAGLContext *>(-[OZFxPlugParameterHandler motionEffectForLockedSharedBase:](self, "motionEffectForLockedSharedBase:"), &v7);
    ProCore_Impl::PCNSRefImpl::operator=(v4, &v7);
    ProCore_Impl::PCNSRefImpl::release(&v7);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v10);
  return v6;
}

- (void)sendUpdateEvent
{
  unsigned __int8 v2 = [(OZFxPlugParameterHandler *)self getScene];
  if (v2)
  {
    unsigned __int8 v3 = (OZDocument *)v2[198];
    OZDocument::postNotification(v3, 2);
  }
}

- (void)callParameterChanged:(id)a3 forParameterID:(unsigned int)a4 modifiedParameterIDs:(void *)a5 changedParameters:(id)a6 supportsParametersChanged:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v10 = *(void *)&a4;
  v13 = (__int32 *)*((void *)a5 + 1);
  v14 = wmemchr(*(__int32 **)a5, a4, ((uint64_t)v13 - *(void *)a5) >> 2);
  if (v14) {
    v15 = v14;
  }
  else {
    v15 = v13;
  }
  if (v15 == *((__int32 **)a5 + 1))
  {
    v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
    if (([v16 isEqualToString:@"com.apple.FinalCut"] & 1) != 0
      || [v16 isEqualToString:@"com.apple.iMovieApp"])
    {
      cntrl = self->_fxPlugLock.__cntrl_;
      ptr = self->_fxPlugLock.__ptr_;
      v31 = cntrl;
      if (cntrl) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
      }
      OZFxPlugLockSentinel::OZFxPlugLockSentinel(&v32, (uint64_t)&ptr);
      if (v31) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v31);
      }
      OZFxPlugRenderContextManager::pushContext(objc_msgSend(*(id *)(*(void *)v32 + 40), "contextManager", ptr), 1);
    }
    if (v7) {
      objc_msgSend(a6, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10));
    }
    else {
      [a3 parameterChanged:v10];
    }
    unint64_t v18 = *((void *)a5 + 2);
    v19 = (__int32 *)*((void *)a5 + 1);
    if ((unint64_t)v19 >= v18)
    {
      uint64_t v21 = *(__int32 **)a5;
      uint64_t v22 = ((uint64_t)v19 - *(void *)a5) >> 2;
      unint64_t v23 = v22 + 1;
      if ((unint64_t)(v22 + 1) >> 62) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v24 = v18 - (void)v21;
      if (v24 >> 1 > v23) {
        unint64_t v23 = v24 >> 1;
      }
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v25 = v23;
      }
      if (v25)
      {
        v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)a5 + 16, v25);
        uint64_t v21 = *(__int32 **)a5;
        v19 = (__int32 *)*((void *)a5 + 1);
      }
      else
      {
        v26 = 0;
      }
      v27 = &v26[4 * v22];
      v28 = &v26[4 * v25];
      *(_DWORD *)v27 = v10;
      v20 = v27 + 4;
      while (v19 != v21)
      {
        int v29 = *--v19;
        *((_DWORD *)v27 - 1) = v29;
        v27 -= 4;
      }
      *(void *)a5 = v27;
      *((void *)a5 + 1) = v20;
      *((void *)a5 + 2) = v28;
      if (v21) {
        operator delete(v21);
      }
    }
    else
    {
      __int32 *v19 = v10;
      v20 = v19 + 1;
    }
    *((void *)a5 + 1) = v20;
  }
}

- (BOOL)folderWasModified:(void *)a3 inDocument:(void *)a4 parameterID:(unsigned int)a5 modifiedParamID:(void *)a6 supportsParametersChanged:(BOOL)a7 paramsChangedArray:(id)a8 target:(id)a9
{
  uint64_t v9 = *((void *)a3 + 14);
  uint64_t v10 = *(const OZChannelBase ***)v9;
  if (*(void *)v9 == *(void *)(v9 + 8))
  {
    LOBYTE(v15) = 0;
    return v15 & 1;
  }
  BOOL v11 = a7;
  uint64_t v14 = *(void *)&a5;
  int v15 = 0;
  v36 = (char *)a6 + 16;
  while (1)
  {
    v17 = *v10;
    unint64_t v18 = (OZNotificationManager *)*((void *)a4 + 21);
    if (v18) {
      break;
    }
LABEL_6:
    if (v17) {
    else
    }
      v19 = 0;
    if (folderIsParameterType((unint64_t)v19)) {
      v15 |= [(OZFxPlugParameterHandler *)self folderWasModified:v19 inDocument:a4 parameterID:v14 modifiedParamID:a6 supportsParametersChanged:v11 paramsChangedArray:a8 target:a9];
    }
    if (++v10 == *(const OZChannelBase ***)(v9 + 8)) {
      return v15 & 1;
    }
  }
  if (!OZNotificationManager::wasChannelModified(v18, v17))
  {
    v17 = *v10;
    goto LABEL_6;
  }
  v20 = (__int32 *)*((void *)a6 + 1);
  uint64_t v21 = wmemchr(*(__int32 **)a6, v14, ((uint64_t)v20 - *(void *)a6) >> 2);
  if (v21) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = v20;
  }
  if (v22 == *((__int32 **)a6 + 1))
  {
    if (v11) {
      objc_msgSend(a8, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v14));
    }
    else {
      [a9 parameterChanged:v14];
    }
    uint64_t v24 = (__int32 *)*((void *)a6 + 1);
    unint64_t v23 = *((void *)a6 + 2);
    if ((unint64_t)v24 >= v23)
    {
      v26 = *(__int32 **)a6;
      uint64_t v27 = ((uint64_t)v24 - *(void *)a6) >> 2;
      unint64_t v28 = v27 + 1;
      if ((unint64_t)(v27 + 1) >> 62) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v29 = v23 - (void)v26;
      if (v29 >> 1 > v28) {
        unint64_t v28 = v29 >> 1;
      }
      if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v30 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v30 = v28;
      }
      if (v30)
      {
        v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)v36, v30);
        v26 = *(__int32 **)a6;
        uint64_t v24 = (__int32 *)*((void *)a6 + 1);
      }
      else
      {
        v31 = 0;
      }
      v32 = &v31[4 * v27];
      v33 = &v31[4 * v30];
      *(_DWORD *)v32 = v14;
      unint64_t v25 = v32 + 4;
      while (v24 != v26)
      {
        int v34 = *--v24;
        *((_DWORD *)v32 - 1) = v34;
        v32 -= 4;
      }
      *(void *)a6 = v32;
      *((void *)a6 + 1) = v25;
      *((void *)a6 + 2) = v33;
      if (v26) {
        operator delete(v26);
      }
    }
    else
    {
      *uint64_t v24 = v14;
      unint64_t v25 = v24 + 1;
    }
    *((void *)a6 + 1) = v25;
  }
  LOBYTE(v15) = 1;
  return v15 & 1;
}

- (void)sendNotifications:(id)a3
{
  if (!self->_sendingNotifications)
  {
    self->_sendingNotifications = 1;
    v5 = [(OZFxPlugParameterHandler *)self getScene];
    if (!v5 || (uint64_t v6 = v5[198]) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_27:
      self->_sendingNotifications = 0;
      return;
    }
    channelMap = (char *)self->_channelMap;
    *(unsigned char *)(v6 + 101) = 1;
    __p = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    cntrl = self->_fxPlugLock.__cntrl_;
    ptr = self->_fxPlugLock.__ptr_;
    v19 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v20, (uint64_t)&ptr);
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v19);
    }
    if (*(void *)v20[0])
    {
      unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
      if ((v10 & 1) == 0)
      {
        OZFxPlugSharedBase::restartPluginXPCIfNecessary(*(OZFxPlugSharedBase **)v20[0]);
        OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v20);
        BOOL v11 = *(char **)self->_channelMap;
        if (v11 != channelMap + 8)
        {
          do
          {
            uint64_t v12 = (void *)*((void *)v11 + 5);
            v13 = *(OZNotificationManager **)(v6 + 168);
            if (v13 && OZNotificationManager::wasChannelModified(v13, *((const OZChannelBase **)v11 + 5)))
            {
              [(OZFxPlugParameterHandler *)self callParameterChanged:a3 forParameterID:*((unsigned int *)v11 + 8) modifiedParameterIDs:&__p changedParameters:v8 supportsParametersChanged:0];
            }
            else
            {
              if (v12) {
              if (folderIsParameterType((unint64_t)v12))
              }
                -[OZFxPlugParameterHandler folderWasModified:inDocument:parameterID:modifiedParamID:supportsParametersChanged:paramsChangedArray:target:](self, "folderWasModified:inDocument:parameterID:modifiedParamID:supportsParametersChanged:paramsChangedArray:target:", v12, v6, *((unsigned int *)v11 + 8), &__p, 0, v8, a3, ptr);
            }
            uint64_t v14 = (char *)*((void *)v11 + 1);
            if (v14)
            {
              do
              {
                int v15 = v14;
                uint64_t v14 = *(char **)v14;
              }
              while (v14);
            }
            else
            {
              do
              {
                int v15 = (char *)*((void *)v11 + 2);
                BOOL v16 = *(void *)v15 == (void)v11;
                BOOL v11 = v15;
              }
              while (!v16);
            }
            BOOL v11 = v15;
          }
          while (v15 != channelMap + 8);
        }
        *(unsigned char *)(v6 + 101) = 0;
        if (__p)
        {
          uint64_t v22 = __p;
          operator delete(__p);
        }
        goto LABEL_27;
      }
      v17 = __p;
    }
    else
    {
      v17 = 0;
    }
    self->_sendingNotifications = 0;
    *(unsigned char *)(v6 + 101) = 0;
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v20);
    if (v17) {
      operator delete(v17);
    }
  }
}

- (void)channelMap
{
  return self->_channelMap;
}

- (void)updateChannelMap
{
  channelMap = (uint64_t **)self->_channelMap;
  v4 = (char *)(channelMap + 1);
  for (i = *channelMap; i != (uint64_t *)(channelMap + 1); v4 = (char *)(channelMap + 1))
  {
    uint64_t v6 = i[5];
    unsigned int v7 = *(_DWORD *)(v6 + 24);
    unsigned int v19 = v7;
    uint64_t v8 = channelMap[1];
    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v9 = v4;
    do
    {
      unsigned int v10 = *((_DWORD *)v8 + 8);
      BOOL v11 = v10 >= v7;
      if (v10 >= v7) {
        uint64_t v12 = (uint64_t **)v8;
      }
      else {
        uint64_t v12 = (uint64_t **)(v8 + 1);
      }
      if (v11) {
        uint64_t v9 = (char *)v8;
      }
      uint64_t v8 = *v12;
    }
    while (*v12);
    if (v9 != v4 && v7 >= *((_DWORD *)v9 + 8))
    {
      v17 = (uint64_t *)i[1];
      if (v17)
      {
        do
        {
          i = v17;
          v17 = (uint64_t *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          unint64_t v18 = i;
          i = (uint64_t *)i[2];
        }
        while ((uint64_t *)*i != v18);
      }
    }
    else
    {
LABEL_13:
      v13 = (uint64_t *)i[1];
      uint64_t v14 = i;
      if (v13)
      {
        do
        {
          int v15 = v13;
          v13 = (uint64_t *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          int v15 = (uint64_t *)v14[2];
          BOOL v16 = *v15 == (void)v14;
          uint64_t v14 = v15;
        }
        while (!v16);
      }
      v20 = &v19;
      std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v19, (uint64_t)&std::piecewise_construct, &v20)[5] = (uint64_t *)v6;
      std::__tree<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>>>::__remove_node_pointer((uint64_t **)self->_channelMap, i);
      operator delete(i);
      channelMap = (uint64_t **)self->_channelMap;
      i = v15;
    }
  }
}

- (vector<unsigned)imageParamIDs
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[1].__begin_;
  v5 = *(void **)begin;
  if (*(unsigned int **)begin != begin + 2)
  {
    uint64_t v6 = self;
    do
    {
      self = (vector<unsigned int, std::allocator<unsigned int>> *)v5[5];
      if (self)
      {
        if (self)
        {
          self = (vector<unsigned int, std::allocator<unsigned int>> *)OZChanSceneNodeRef::getNode((OZChannelBase *)self);
          if (self)
          {
            end = retstr->__end_;
            value = retstr->__end_cap_.__value_;
            if (end >= value)
            {
              self = (vector<unsigned int, std::allocator<unsigned int>> *)retstr->__begin_;
              uint64_t v10 = end - retstr->__begin_;
              unint64_t v11 = v10 + 1;
              if ((unint64_t)(v10 + 1) >> 62) {
                std::vector<double>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v12 = (char *)value - (char *)self;
              if (v12 >> 1 > v11) {
                unint64_t v11 = v12 >> 1;
              }
              if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v13 = v11;
              }
              if (v13)
              {
                uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&retstr->__end_cap_, v13);
                self = (vector<unsigned int, std::allocator<unsigned int>> *)retstr->__begin_;
                end = retstr->__end_;
              }
              else
              {
                uint64_t v14 = 0;
              }
              int v15 = (unsigned int *)&v14[4 * v10];
              unsigned int *v15 = *((_DWORD *)v5 + 8);
              uint64_t v9 = v15 + 1;
              while (end != (unsigned int *)self)
              {
                unsigned int v16 = *--end;
                *--int v15 = v16;
              }
              retstr->__begin_ = v15;
              retstr->__end_ = v9;
              retstr->__end_cap_.__value_ = (unsigned int *)&v14[4 * v13];
              if (self) {
                operator delete(self);
              }
            }
            else
            {
              unsigned int *end = *((_DWORD *)v5 + 8);
              uint64_t v9 = end + 1;
            }
            retstr->__end_ = v9;
          }
        }
      }
      v17 = (void *)v5[1];
      if (v17)
      {
        do
        {
          unint64_t v18 = v17;
          v17 = (void *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          unint64_t v18 = (void *)v5[2];
          BOOL v19 = *v18 == (void)v5;
          v5 = v18;
        }
        while (!v19);
      }
      v5 = v18;
    }
    while (v18 != (void *)v6[1].__begin_ + 1);
  }
  return self;
}

- (unsigned)paramIDForImageWellWithSceneNode:(unsigned int)a3
{
  if (!self)
  {
    unsigned int v11 = 0;
    __p = 0;
    int v15 = 0;
    uint64_t v16 = 0;
    return v11;
  }
  [(OZFxPlugParameterHandler *)self imageParamIDs];
  v5 = (unsigned int *)__p;
  uint64_t v6 = v15;
  if (__p == v15)
  {
    unsigned int v11 = 0;
    if (!__p) {
      return v11;
    }
    goto LABEL_12;
  }
  while (1)
  {
    unsigned int v13 = *v5;
    channelMap = (uint64_t **)self->_channelMap;
    v17 = &v13;
    uint64_t v8 = std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v13, (uint64_t)&std::piecewise_construct, &v17)[5];
    if (v8)
    {
      if (v9)
      {
        Node = OZChanSceneNodeRef::getNode(v9);
        if (Node)
        {
          if (Node[20] == a3) {
            break;
          }
        }
      }
    }
    if (++v5 == v6)
    {
      unsigned int v11 = 0;
      goto LABEL_9;
    }
  }
  unsigned int v11 = v13;
LABEL_9:
  v5 = (unsigned int *)__p;
  if (__p)
  {
LABEL_12:
    int v15 = v5;
    operator delete(v5);
  }
  return v11;
}

- (BOOL)containsParameterWithID:(unsigned int)a3
{
  channelMap = self->_channelMap;
  uint64_t v6 = (char *)channelMap[1];
  v4 = (char *)(channelMap + 1);
  v5 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  unsigned int v7 = v4;
  do
  {
    unsigned int v8 = *((_DWORD *)v5 + 8);
    BOOL v9 = v8 >= a3;
    if (v8 >= a3) {
      uint64_t v10 = (char **)v5;
    }
    else {
      uint64_t v10 = (char **)(v5 + 8);
    }
    if (v9) {
      unsigned int v7 = v5;
    }
    v5 = *v10;
  }
  while (*v10);
  if (v7 == v4 || *((_DWORD *)v7 + 8) > a3) {
LABEL_12:
  }
    unsigned int v7 = v4;
  return v7 != v4;
}

- (void)saveParameterFlags
{
  channelMap = self->_channelMap;
  unsigned __int8 v3 = (void *)*channelMap;
  if ((void *)*channelMap != channelMap + 1)
  {
    do
    {
      uint64_t v5 = v3[5];
      unsigned int v11 = *(_DWORD *)(v5 + 24);
      uint64_t v6 = *(uint64_t **)(v5 + 56);
      flagMap = (uint64_t **)self->_flagMap;
      uint64_t v12 = &v11;
      std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(flagMap, &v11, (uint64_t)&std::piecewise_construct, &v12)[5] = v6;
      unsigned int v8 = (void *)v3[1];
      if (v8)
      {
        do
        {
          BOOL v9 = v8;
          unsigned int v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          BOOL v9 = (void *)v3[2];
          BOOL v10 = *v9 == (void)v3;
          unsigned __int8 v3 = v9;
        }
        while (!v10);
      }
      unsigned __int8 v3 = v9;
    }
    while (v9 != (void *)self->_channelMap + 1);
  }
}

- (void)restoreParameterFlagsForChannel:(OZChannelBase *)a3
{
  channelMap = self->_channelMap;
  uint64_t v6 = (char *)channelMap[1];
  v4 = (char *)(channelMap + 1);
  uint64_t v5 = v6;
  if (v6)
  {
    unsigned int var3 = a3->var3;
    unsigned int v8 = v4;
    do
    {
      unsigned int v9 = *((_DWORD *)v5 + 8);
      BOOL v10 = v9 >= var3;
      if (v9 >= var3) {
        unsigned int v11 = (char **)v5;
      }
      else {
        unsigned int v11 = (char **)(v5 + 8);
      }
      if (v10) {
        unsigned int v8 = v5;
      }
      uint64_t v5 = *v11;
    }
    while (*v11);
    if (v8 != v4 && var3 >= *((_DWORD *)v8 + 8) && *((OZChannelBase **)v8 + 5) == a3)
    {
      flagMap = self->_flagMap;
      int v15 = (char *)flagMap[1];
      unsigned int v13 = (char *)(flagMap + 1);
      uint64_t v14 = v15;
      if (v15)
      {
        uint64_t v16 = v13;
        do
        {
          unsigned int v17 = *((_DWORD *)v14 + 8);
          BOOL v18 = v17 >= var3;
          if (v17 >= var3) {
            BOOL v19 = (char **)v14;
          }
          else {
            BOOL v19 = (char **)(v14 + 8);
          }
          if (v18) {
            uint64_t v16 = v14;
          }
          uint64_t v14 = *v19;
        }
        while (*v19);
        if (v16 != v13 && var3 >= *((_DWORD *)v16 + 8)) {
          OZChannelBase::setFlags(a3, a3->var7 & 0xFFFFFFFFFFBEFFC3 | *((void *)v16 + 5) & 0x41003CLL);
        }
      }
    }
  }
}

- (OZChannelBase)channelWithID:(int)a3
{
  channelMap = self->_channelMap;
  uint64_t v6 = (char *)channelMap[1];
  v4 = (char *)(channelMap + 1);
  uint64_t v5 = v6;
  if (!v6) {
    return 0;
  }
  unsigned int v7 = v4;
  do
  {
    unsigned int v8 = *((_DWORD *)v5 + 8);
    BOOL v9 = v8 >= a3;
    if (v8 >= a3) {
      BOOL v10 = (char **)v5;
    }
    else {
      BOOL v10 = (char **)(v5 + 8);
    }
    if (v9) {
      unsigned int v7 = v5;
    }
    uint64_t v5 = *v10;
  }
  while (*v10);
  if (v7 != v4 && *((_DWORD *)v7 + 8) <= a3) {
    return (OZChannelBase *)*((void *)v7 + 5);
  }
  else {
    return 0;
  }
}

- (unsigned)parameterCount
{
  channelMap = (char *)self->_channelMap;
  unsigned int result = *((_DWORD *)channelMap + 4);
  v4 = channelMap + 8;
  uint64_t v5 = *(void **)channelMap;
  if (v4 != v5)
  {
    do
    {
      uint64_t v6 = (void *)*v4;
      unsigned int v7 = (void *)*v4;
      unsigned int v8 = v4;
      if (*v4)
      {
        do
        {
          BOOL v9 = v7;
          unsigned int v7 = (void *)v7[1];
        }
        while (v7);
      }
      else
      {
        do
        {
          BOOL v9 = (void *)v8[2];
          BOOL v10 = *v9 == (void)v8;
          unsigned int v8 = v9;
        }
        while (v10);
      }
      int v11 = *(_DWORD *)(v9[5] + 24) >> 4 > 0x270u;
      if (v6)
      {
        do
        {
          uint64_t v12 = v6;
          uint64_t v6 = (void *)v6[1];
        }
        while (v6);
      }
      else
      {
        do
        {
          uint64_t v12 = (void *)v4[2];
          BOOL v10 = *v12 == (void)v4;
          v4 = v12;
        }
        while (v10);
      }
      result -= v11;
      v4 = v12;
    }
    while (v12 != v5);
  }
  return result;
}

- (OZChannelBase)parameterAtIndex:(unsigned int)a3
{
  unsigned int v3 = 0;
  v4 = *(void **)self->_channelMap;
  while (v3 != a3)
  {
    uint64_t v5 = (void *)v4[1];
    if (v5)
    {
      do
      {
        uint64_t v6 = v5;
        uint64_t v5 = (void *)*v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        uint64_t v6 = (void *)v4[2];
        BOOL v7 = *v6 == (void)v4;
        v4 = v6;
      }
      while (!v7);
    }
    ++v3;
    v4 = v6;
    if (v3 > a3) {
      return 0;
    }
  }
  return (OZChannelBase *)v4[5];
}

- (void)removeParameter:(unsigned int)a3
{
  channelMap = self->_channelMap;
  BOOL v7 = (char *)channelMap[1];
  uint64_t v5 = (char *)(channelMap + 1);
  uint64_t v6 = v7;
  if (!v7) {
    goto LABEL_12;
  }
  unsigned int v8 = v5;
  do
  {
    unsigned int v9 = *((_DWORD *)v6 + 8);
    BOOL v10 = v9 >= a3;
    if (v9 >= a3) {
      int v11 = (char **)v6;
    }
    else {
      int v11 = (char **)(v6 + 8);
    }
    if (v10) {
      unsigned int v8 = v6;
    }
    uint64_t v6 = *v11;
  }
  while (*v11);
  if (v8 == v5 || *((_DWORD *)v8 + 8) > a3) {
LABEL_12:
  }
    unsigned int v8 = v5;
  uint64_t v12 = (OZChannelBase *)*((void *)v8 + 5);
  uint64_t v24 = 0;
  unsigned int v13 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v24, 1uLL);
  void *v13 = v12;
  __p = v13;
  uint64_t v24 = &v13[v14];
  if (v12)
  {
    if (v15)
    {
      begin = self->_customParameterList.__begin_;
      end = self->_customParameterList.__end_;
      if (begin != end)
      {
        uint64_t v18 = 0;
        while (v15 != begin[v18])
        {
          if (&begin[++v18] == end) {
            goto LABEL_24;
          }
        }
        v20 = &begin[v18];
        uint64_t v21 = &begin[v18 + 1];
        int64_t v22 = (char *)end - (char *)v21;
        if (end != v21) {
          memmove(&begin[v18], v21, (char *)end - (char *)v21);
        }
        self->_customParameterList.__end_ = (OZChannelBlindData **)((char *)v20 + v22);
      }
    }
LABEL_24:
    var6 = v12->var6;
  }
  else
  {
    var6 = 0;
  }
  OZChannelFolder::removeDescendant(var6, v12);
  std::__tree<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVInstructionGraphNode * {__strong}>>>::__remove_node_pointer((uint64_t **)self->_channelMap, (uint64_t *)v8);
  operator delete(v8);
  -[OZFxPlugParameterHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateInspectorAndDeleteChannel_, [MEMORY[0x1E4F29238] valueWithPointer:v12], 0.0);
  if (__p) {
    operator delete(__p);
  }
}

- (void)updateInspectorAndDeleteChannel:(id)a3
{
  uint64_t v6 = 0;
  [a3 getValue:&v6];
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    uint64_t v6 = 0;
  }
  v4 = [(OZFxPlugParameterHandler *)self getScene];
  if (v4)
  {
    uint64_t v5 = (OZDocument *)v4[198];
    if (v5) {
      OZDocument::postNotification(v5, 134742016);
    }
  }
}

- (void)updateInspector
{
  unsigned __int8 v2 = [(OZFxPlugParameterHandler *)self getScene];
  if (v2)
  {
    unsigned int v3 = (OZDocument *)v2[198];
    if (v3)
    {
      OZDocument::postNotification(v3, 134742016);
    }
  }
}

- (void)updateKeyframeEditor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __48__OZFxPlugParameterHandler_updateKeyframeEditor__block_invoke;
  block[3] = &unk_1E616BC38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__OZFxPlugParameterHandler_updateKeyframeEditor__block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 motionEffectRef];
    if (v5) {
      goto LABEL_8;
    }
    unsigned __int8 v2 = *(void **)(a1 + 32);
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v3 = [v2 getScene];
  if (v3)
  {
    v4 = *(OZDocument **)(v3 + 1584);
    if (v4) {
      OZDocument::postNotification(v4, 137216);
    }
  }
LABEL_8:
  ProCore_Impl::PCNSRefImpl::release(&v5);
}

- (double)convertFromFigTime:(id *)a3 meOffset:(double)a4 motionEffect:(id)a5
{
  return FigTimeToFrames(&v6, (uint64_t)[(OZFxPlugParameterHandler *)self getScene], (uint64_t)a5)- a4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToFigTime:(SEL)a3 meOffset:(double)a4 motionEffect:(double)a5
{
  double v8 = a4 + a5;
  unsigned int v9 = [(OZFxPlugParameterHandler *)self getScene];

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FramesToFigTime(v9, (uint64_t)a6, (uint64_t)retstr, v8);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fxTimeToFigTime:(SEL)a3 withConversionData:(id)a4
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)a4.var1;
  return self;
}

- ($EBBD99E4BEE052F512DA5DADC73F537E)figTimeToFxTime:(id *)a3 withConversionData:(void *)a4
{
  int v15 = 0;
  if (self) {
    [(OZFxPlugParameterHandler *)self motionEffectRef];
  }
  else {
    id v14 = 0;
  }
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v12 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v13, (uint64_t)&ptr);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
  }
  if (!*(void *)v13[0] || (unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v7 & 1) != 0))
  {
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v13);
  }
  else
  {
    int v8 = (*(uint64_t (**)(void))(**(void **)v13[0] + 160))(*(void *)v13[0]);
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v13);
    if (v8)
    {
      int v15 = a3;
    }
    else
    {
      -[OZFxPlugParameterHandler convertFromFigTime:meOffset:motionEffect:](self, "convertFromFigTime:meOffset:motionEffect:", a3, v14, 0.0, ptr);
      int v15 = v10;
    }
  }
  ProCore_Impl::PCNSRefImpl::release(&v14);
  return ($EBBD99E4BEE052F512DA5DADC73F537E)v15;
}

- ($EBBD99E4BEE052F512DA5DADC73F537E)figDurationToFxDuration:(id *)a3 withConversionData:(void *)a4
{
  v5.var0 = COERCE_DOUBLE([(OZFxPlugParameterHandler *)self figTimeToFxTime:a3 withConversionData:a4]);
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  BOOL v10 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v11, (uint64_t)&ptr);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  if (*(void *)v11[0])
  {
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
    if ((v7 & 1) == 0) {
      v5.var0 = TXTextLayout::getLineShift(*(TXTextLayout **)v11[0]) + v5.var0;
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v11);
  return ($EBBD99E4BEE052F512DA5DADC73F537E)v5.var1;
}

- (void)setHandlingOSCEvents:(BOOL)a3
{
}

- (void)beginTimingOperation:(id *)a3 forChannel:(OZChannelBase *)a4
{
  return 0;
}

- (BOOL)usesRationalTime
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  int v8 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v9, (uint64_t)&ptr);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  if (!*(void *)v9[0] || (unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v4 & 1) != 0)) {
    char v5 = 0;
  }
  else {
    char v5 = (*(uint64_t (**)(void))(**(void **)v9[0] + 160))(*(void *)v9[0]);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v9);
  return v5;
}

- (void)markForDynamicParameterUsage
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  long long v6 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v7, (uint64_t)&ptr);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
  if (*(void *)v7[0])
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
    if ((v4 & 1) == 0) {
      (*(void (**)(void, uint64_t))(**(void **)v7[0] + 200))(*(void *)v7[0], 1);
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v7);
}

- (void)addExistingChannel:(OZChannelBase *)a3
{
  folderStack = self->_folderStack;
  unint64_t v6 = folderStack[5] + folderStack[4] - 1;
  unsigned __int8 v7 = *(OZChannelFolder **)(*(void *)(folderStack[1] + ((v6 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v6 & 0x1FF));
  OZChannelBase::registerParent(a3, v7);
  OZChannelFolder::push_back(v7, a3);
  channelMap = (uint64_t **)self->_channelMap;
  unsigned int var3 = a3->var3;
  p_unsigned int var3 = &var3;
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &var3, (uint64_t)&std::piecewise_construct, &p_var3)[5] = (uint64_t *)a3;
  [(OZFxPlugParameterHandler *)self addParamMappingForParameterChannel:a3];
}

- (void)addExistingGroup:(void *)a3
{
  unsigned __int8 v4 = a3;
  -[OZFxPlugParameterHandler addExistingChannel:](self, "addExistingChannel:");
  std::deque<OZChannelFolder *>::push_back((void *)self->_folderStack, &v4);
}

- (id)displayName
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  int v8 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v9, (uint64_t)&ptr);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  if (!*(void *)v9[0] || (unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v4 & 1) != 0)) {
    char v5 = 0;
  }
  else {
    char v5 = objc_msgSend(*(id *)(*(void *)v9[0] + 16), "displayName", ptr);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v9);
  return v5;
}

- (void)addMixSlider:(unsigned int)a3
{
}

- (void)addMixSlider:(unsigned int)a3 withChannel:(OZChannelPercent *)a4
{
  unsigned int v7 = a3;
  OZChannelBase::resetFlag((OZChannelBase *)a4, 16, 0);
  OZChannelBase::setFlag((OZChannelBase *)a4, 0x100000000, 0);
  channelMap = (uint64_t **)self->_channelMap;
  int v8 = &v7;
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v7, (uint64_t)&std::piecewise_construct, &v8)[5] = (uint64_t *)a4;
}

- (OZChannelPercent)mixChannel
{
  channelMap = self->_channelMap;
  char v5 = (char *)channelMap[1];
  uint64_t v3 = (char *)(channelMap + 1);
  unsigned __int8 v4 = v5;
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v3;
  do
  {
    unsigned int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 >= 0x2711;
    if (v7 >= 0x2711) {
      unsigned int v9 = (char **)v4;
    }
    else {
      unsigned int v9 = (char **)(v4 + 8);
    }
    if (v8) {
      unint64_t v6 = v4;
    }
    unsigned __int8 v4 = *v9;
  }
  while (*v9);
  if (v6 != v3 && *((_DWORD *)v6 + 8) <= 0x2711u && (BOOL v10 = (const void *)*((void *)v6 + 5)) != 0) {
  else
  }
    return 0;
}

- (double)mixAmountAtTime:(id)a3
{
  double v7 = 1.0;
  char v5 = [(OZFxPlugParameterHandler *)self mixChannel];
  if (!v5) {
    return 1.0;
  }
  [(OZFxPlugParameterHandler *)self _getFloatValue:&v7 fromParm:v5->var3 atTime:a3.var1];
  return v7;
}

- (void)addFlipCheckbox:(unsigned int)a3
{
}

- (void)addFlipCheckbox:(unsigned int)a3 withChannel:(OZChannelBool *)a4
{
  unsigned int v7 = a3;
  OZChannelBase::setFlag((OZChannelBase *)a4, 4259872, 0);
  OZChannelBase::resetFlag((OZChannelBase *)a4, 16, 0);
  OZChannelBase::setFlag((OZChannelBase *)a4, 0x100000000, 0);
  channelMap = (uint64_t **)self->_channelMap;
  BOOL v8 = &v7;
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v7, (uint64_t)&std::piecewise_construct, &v8)[5] = (uint64_t *)a4;
}

- (OZChannelBool)flipChannel
{
  channelMap = self->_channelMap;
  char v5 = (char *)channelMap[1];
  uint64_t v3 = (char *)(channelMap + 1);
  unsigned __int8 v4 = v5;
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v3;
  do
  {
    unsigned int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 >= 0x2712;
    if (v7 >= 0x2712) {
      unsigned int v9 = (char **)v4;
    }
    else {
      unsigned int v9 = (char **)(v4 + 8);
    }
    if (v8) {
      unint64_t v6 = v4;
    }
    unsigned __int8 v4 = *v9;
  }
  while (*v9);
  if (v6 != v3 && *((_DWORD *)v6 + 8) <= 0x2712u && (BOOL v10 = (const void *)*((void *)v6 + 5)) != 0) {
  else
  }
    return 0;
}

- (BOOL)shouldFlipPoints
{
  unsigned __int8 v2 = [(OZFxPlugParameterHandler *)self flipChannel];
  if (v2) {
    LOBYTE(v2) = OZChannel::getValueAsInt((OZChannel *)v2, MEMORY[0x1E4F1FA48], 0.0) == 1;
  }
  return (char)v2;
}

- (void)addInputPointsCheckbox:(unsigned int)a3
{
}

- (void)addInputPointsCheckbox:(unsigned int)a3 withChannel:(OZChannelBool *)a4
{
  unsigned int v7 = a3;
  OZChannelBase::setFlag((OZChannelBase *)a4, 4259872, 0);
  OZChannelBase::resetFlag((OZChannelBase *)a4, 16, 0);
  OZChannelBase::setFlag((OZChannelBase *)a4, 0x100000000, 0);
  channelMap = (uint64_t **)self->_channelMap;
  BOOL v8 = &v7;
  std::__tree<std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PVImageBuffer * {__strong}>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PVImageBuffer * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(channelMap, &v7, (uint64_t)&std::piecewise_construct, &v8)[5] = (uint64_t *)a4;
}

- (BOOL)useInputPoints
{
  unsigned __int8 v2 = [(OZFxPlugParameterHandler *)self inputPointsChannel];
  if (v2) {
    LOBYTE(v2) = OZChannel::getValueAsInt((OZChannel *)v2, MEMORY[0x1E4F1FA48], 0.0) == 1;
  }
  return (char)v2;
}

- (OZChannelBool)inputPointsChannel
{
  channelMap = self->_channelMap;
  char v5 = (char *)channelMap[1];
  uint64_t v3 = (char *)(channelMap + 1);
  unsigned __int8 v4 = v5;
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v3;
  do
  {
    unsigned int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 >= 0x2713;
    if (v7 >= 0x2713) {
      unsigned int v9 = (char **)v4;
    }
    else {
      unsigned int v9 = (char **)(v4 + 8);
    }
    if (v8) {
      unint64_t v6 = v4;
    }
    unsigned __int8 v4 = *v9;
  }
  while (*v9);
  if (v6 != v3 && *((_DWORD *)v6 + 8) >> 2 <= 0x9C4u && (BOOL v10 = (const void *)*((void *)v6 + 5)) != 0) {
  else
  }
    return 0;
}

- (void)addAbsolutePointCheckbox:(unsigned int)a3
{
}

- (BOOL)useAbsolutePoints
{
  unsigned __int8 v2 = [(OZFxPlugParameterHandler *)self absolutePointsChannel];
  if (v2) {
    LOBYTE(v2) = OZChannel::getValueAsInt((OZChannel *)v2, MEMORY[0x1E4F1FA48], 0.0) == 1;
  }
  return (char)v2;
}

- (OZChannelBool)absolutePointsChannel
{
  channelMap = self->_channelMap;
  char v5 = (char *)channelMap[1];
  uint64_t v3 = (char *)(channelMap + 1);
  unsigned __int8 v4 = v5;
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v3;
  do
  {
    unsigned int v7 = *((_DWORD *)v4 + 8) >> 2;
    BOOL v8 = v7 >= 0x9C5;
    if (v7 >= 0x9C5) {
      unsigned int v9 = (char **)v4;
    }
    else {
      unsigned int v9 = (char **)(v4 + 8);
    }
    if (v8) {
      unint64_t v6 = v4;
    }
    unsigned __int8 v4 = *v9;
  }
  while (*v9);
  if (v6 != v3 && *((_DWORD *)v6 + 8) <= 0x2714u && (BOOL v10 = (const void *)*((void *)v6 + 5)) != 0) {
  else
  }
    return 0;
}

- (void)addPublishOSCCheckbox:(unsigned int)a3
{
  if (![(OZFxPlugParameterHandler *)self publishOSCChannel]) {
    operator new();
  }
}

- (OZChannelBool)publishOSCChannel
{
  channelMap = self->_channelMap;
  char v5 = (char *)channelMap[1];
  uint64_t v3 = (char *)(channelMap + 1);
  unsigned __int8 v4 = v5;
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v3;
  do
  {
    unsigned int v7 = *((_DWORD *)v4 + 8);
    BOOL v8 = v7 >= 0x2715;
    if (v7 >= 0x2715) {
      unsigned int v9 = (char **)v4;
    }
    else {
      unsigned int v9 = (char **)(v4 + 8);
    }
    if (v8) {
      unint64_t v6 = v4;
    }
    unsigned __int8 v4 = *v9;
  }
  while (*v9);
  if (v6 != v3 && *((_DWORD *)v6 + 8) <= 0x2715u && (BOOL v10 = (const void *)*((void *)v6 + 5)) != 0) {
  else
  }
    return 0;
}

- (void)setDoneAddingParams:(BOOL)a3
{
  self->_postAddParameters = a3;
}

- (BOOL)doneAddingParams
{
  return self->_postAddParameters;
}

- (void)removeHiddenParameters
{
  folderStack = self->_folderStack;
  unint64_t v4 = folderStack[5] + folderStack[4] - 1;
  char v5 = *(OZChannelFolder **)(*(void *)(folderStack[1] + ((v4 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v4 & 0x1FF));
  OZChannelFolder::removeDescendant(v5, (OZChannelBase *)[(OZFxPlugParameterHandler *)self mixChannel]);
  OZChannelFolder::removeDescendant(v5, (OZChannelBase *)[(OZFxPlugParameterHandler *)self flipChannel]);
  OZChannelFolder::removeDescendant(v5, (OZChannelBase *)[(OZFxPlugParameterHandler *)self inputPointsChannel]);
  unint64_t v6 = [(OZFxPlugParameterHandler *)self absolutePointsChannel];
  if (v6) {
    OZChannelFolder::removeDescendant(v5, (OZChannelBase *)v6);
  }
  unsigned int v7 = [(OZFxPlugParameterHandler *)self publishOSCChannel];
  if (v7)
  {
    OZChannelFolder::removeDescendant(v5, (OZChannelBase *)v7);
  }
}

- (void)reAddHiddenParameters
{
  folderStack = self->_folderStack;
  unint64_t v4 = folderStack[5] + folderStack[4] - 1;
  char v5 = *(OZChannelFolder **)(*(void *)(folderStack[1] + ((v4 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v4 & 0x1FF));
  OZChannelFolder::push_back(v5, (OZChannelBase *)[(OZFxPlugParameterHandler *)self mixChannel]);
  OZChannelFolder::push_back(v5, (OZChannelBase *)[(OZFxPlugParameterHandler *)self flipChannel]);
  OZChannelFolder::push_back(v5, (OZChannelBase *)[(OZFxPlugParameterHandler *)self inputPointsChannel]);
  unint64_t v6 = [(OZFxPlugParameterHandler *)self absolutePointsChannel];
  if (v6) {
    OZChannelFolder::push_back(v5, (OZChannelBase *)v6);
  }
  unsigned int v7 = [(OZFxPlugParameterHandler *)self publishOSCChannel];
  if (v7) {
    OZChannelFolder::push_back(v5, (OZChannelBase *)v7);
  }

  [(OZFxPlugParameterHandler *)self updateInspector];
}

- (void)movePublishOSCChannelToEnd
{
  uint64_t v3 = [(OZFxPlugParameterHandler *)self publishOSCChannel];
  if (v3)
  {
    unint64_t v4 = (OZChannelBase *)v3;
    folderStack = self->_folderStack;
    unint64_t v6 = folderStack[5] + folderStack[4] - 1;
    unsigned int v7 = *(OZChannelFolder **)(*(void *)(folderStack[1] + ((v6 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v6 & 0x1FF));
    OZChannelFolder::removeDescendant(v7, (OZChannelBase *)v3);
    OZChannelFolder::push_back(v7, v4);
    [(OZFxPlugParameterHandler *)self updateInspector];
  }
}

- (void)forceRenderAtTime:(id)a3
{
}

- (void)setParameterFlags:(unsigned int)a3 forChannel:(OZChannelBase *)a4
{
  if (a3)
  {
    (*((void (**)(OZChannelBase *, void, void))a4->var0 + 63))(a4, 0, 0);
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  OZChannelBase::setFlag(a4, 4259872, 0);
  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  OZChannelBase::setFlag(a4, 4, 0);
  if ((a3 & 0x10) == 0)
  {
LABEL_5:
    if ((a3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  OZChannelBase::setFlag(a4, 8, 0);
  OZChannelBase::resetFlag(a4, 0x100000000, 0);
  if ((a3 & 0x20) == 0)
  {
LABEL_6:
    if ((a3 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  OZChannelBase::resetFlag(a4, 16, 0);
  if ((a3 & 0x200) == 0)
  {
LABEL_7:
    if ((a3 & 0x20000) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    OZChannelBase::setFlag(a4, 0x400000, 0);
    if ((a3 & 0x40) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  OZChannelBase::setFlag(a4, 0x10000, 0);
  if ((a3 & 0x20000) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((a3 & 0x40) == 0) {
    return;
  }
LABEL_17:

  OZChannelBase::setFlag(a4, 0x1000000000, 0);
}

- (BOOL)addFloatSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(double)a5 parameterMin:(double)a6 parameterMax:(double)a7 sliderMin:(double)a8 sliderMax:(double)a9 delta:(double)a10 parmFlags:(unsigned int)a11
{
  LODWORD(v12) = a4;
  if (-[OZFxPlugParameterHandler _floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:](self, "_floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:", *(void *)&a4, *(void *)&a11, a6, a7, a8, a9, a5, v12))
  {
    operator new();
  }
  return 0;
}

- (BOOL)addPercentSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(double)a5 parameterMin:(double)a6 parameterMax:(double)a7 sliderMin:(double)a8 sliderMax:(double)a9 delta:(double)a10 parmFlags:(unsigned int)a11
{
  LODWORD(v12) = a4;
  if (-[OZFxPlugParameterHandler _floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:](self, "_floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:", *(void *)&a4, *(void *)&a11, a6, a7, a8, a9, a5, v12))
  {
    operator new();
  }
  return 0;
}

- (BOOL)addIntSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(int)a5 parameterMin:(int)a6 parameterMax:(int)a7 sliderMin:(int)a8 sliderMax:(int)a9 delta:(int)a10 parmFlags:(unsigned int)a11
{
  LODWORD(v13) = a11;
  BOOL v11 = [(OZFxPlugParameterHandler *)self _intParameter:*(void *)&a4 hasValidMin:*(void *)&a6 max:*(void *)&a7 sliderMin:*(void *)&a8 sliderMax:a9 defaultValue:*(void *)&a5 paramFlags:v13];
  if (v11) {
    operator new();
  }
  return v11;
}

- (BOOL)addToggleButtonWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(BOOL)a5 parmFlags:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a4;
  LODWORD(v12) = a4;
  BOOL v9 = -[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(void *)&a4, 1, 0, v12);
  BOOL v10 = v9 & [(OZFxPlugParameterHandler *)self parameter:v7 hasValidFlags:v6];
  if (v10) {
    operator new();
  }
  return v10;
}

- (BOOL)addAngleSliderWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(double)a5 parameterMin:(double)a6 parameterMax:(double)a7 parmFlags:(unsigned int)a8
{
  LODWORD(v9) = a4;
  if (-[OZFxPlugParameterHandler _floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:](self, "_floatParameter:hasValidMin:max:sliderMin:sliderMax:defaultValue:paramFlags:", *(void *)&a4, *(void *)&a8, a6, a7, a6, a7, a5 * 3.14159265 / 180.0, v9))
  {
    operator new();
  }
  return 0;
}

- (OZFxPlugColorTransformInfo)getColorTransformInfo
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  v20 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v21, (uint64_t)&ptr);
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v20);
  }
  uint64_t v6 = *(OZFxPlugSharedBase **)v21[0];
  if (*(void *)v21[0]
    && (unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v7 & 1) == 0)
    && (*(uint64_t (**)(void))(*(void *)v6 + 24))(*(void *)v21[0]))
  {
    OZFxRenderContextAgentSentry::OZFxRenderContextAgentSentry((OZFxRenderContextAgentSentry *)v18, &self->_threadContextManager);
    Agent = (LiAgent *)OZFxRenderContextAgentSentry::getAgent(v18, v6);
    uint64_t v9 = Agent;
    if (Agent)
    {
      uint64_t RequestedColorDescription = LiAgent::getRequestedColorDescription(Agent);
      BOOL v11 = *(CGColorSpace **)RequestedColorDescription;
      retstr->var0._pcColorDesc._colorSpaceRef._obj = *(CGColorSpace **)RequestedColorDescription;
      if (v11) {
        PCCFRefTraits<CGColorSpace *>::retain(v11);
      }
      uint64_t v12 = *(void *)(RequestedColorDescription + 8);
      retstr->var0._pcColorDesc._toneMapMethod._gain = *(float *)(RequestedColorDescription + 16);
      *(void *)&retstr->var0._pcColorDesc._dynamicRange = v12;
      retstr->var0._isPremultiplied = *(unsigned char *)(RequestedColorDescription + 24);
      OZFxPlugSharedBase::getPluginColorDescription((id *)v6, v9, &retstr->var1);
    }
    else
    {
      *(_OWORD *)&retstr->var1._pcColorDesc._colorSpaceRef._obj = 0u;
      *(_OWORD *)&retstr->var1._pcColorDesc._toneMapMethod._gain = 0u;
      *(_OWORD *)&retstr->var0._pcColorDesc._colorSpaceRef._obj = 0u;
      *(_OWORD *)&retstr->var0._pcColorDesc._toneMapMethod._gain = 0u;
      int v15 = PCGetNCLCColorSpace(kPCNCLC_Rec709Linear);
      FxColorDescription::FxColorDescription((uint64_t)retstr, v15, 0, &kPCNoToneMapMethod, 1);
      uint64_t v16 = PCGetNCLCColorSpace(kPCNCLC_Rec709Linear);
      FxColorDescription::FxColorDescription((uint64_t)&retstr->var1, v16, 0, &kPCNoToneMapMethod, 1);
    }
    OZFxRenderContextAgentSentry::~OZFxRenderContextAgentSentry((OZFxRenderContextAgentSentry *)v18);
  }
  else
  {
    *(_OWORD *)&retstr->var1._pcColorDesc._colorSpaceRef._obj = 0u;
    *(_OWORD *)&retstr->var1._pcColorDesc._toneMapMethod._gain = 0u;
    *(_OWORD *)&retstr->var0._pcColorDesc._colorSpaceRef._obj = 0u;
    *(_OWORD *)&retstr->var0._pcColorDesc._toneMapMethod._gain = 0u;
    uint64_t v13 = PCGetNCLCColorSpace(kPCNCLC_Rec709Linear);
    FxColorDescription::FxColorDescription((uint64_t)retstr, v13, 0, &kPCNoToneMapMethod, 1);
    id v14 = PCGetNCLCColorSpace(kPCNCLC_Rec709Linear);
    FxColorDescription::FxColorDescription((uint64_t)&retstr->var1, v14, 0, &kPCNoToneMapMethod, 1);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v21);
  return result;
}

- (void)getColorInFxPlugColorSpace:(void *)a3 red:(float *)a4 green:(float *)a5 blue:(float *)a6 alpha:(float *)a7
{
  if (self)
  {
    [(OZFxPlugParameterHandler *)self getColorTransformInfo];
  }
  else
  {
    memset(&v23, 0, sizeof(v23));
    memset(&v22, 0, sizeof(v22));
  }
  CGColorSpace = (CGColorSpace *)FxColorDescription::getCGColorSpace(&v23);
  int DynamicRange = FxColorDescription::getDynamicRange(&v23);
  if (FxColorDescription::isDynamicRangeManaged(&v22)) {
    ToneMapMethod = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v22);
  }
  else {
    ToneMapMethod = (PCToneMapMethod *)&kPCNoToneMapMethod;
  }
  PCToneMapMethod v21 = *ToneMapMethod;
  if (FxColorDescription::isHDR(&v22) && FxColorDescription::isSDR(&v23))
  {
    int v15 = PCGetNCLCColorSpace((unsigned int *)&kPCNCLC_Rec2020Linear);
    int v20 = 0;
    uint64_t v19 = 0;
    PCColor::getRGBA((int *)a3, (float *)&v19, (float *)&v19 + 1, (float *)&v20, a7, v15, 1, &v21);
    uint64_t v16 = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v23);
    PCColorUtil::transform(v16, &v19, (uint64_t)v15, 1, (uint64_t)CGColorSpace, DynamicRange, (uint64_t)v18);
    int v17 = v18[1];
    *a4 = *(float *)v18;
    *(_DWORD *)a5 = v17;
    *a6 = *(float *)&v18[2];
  }
  else
  {
    PCColor::getRGBA((int *)a3, a4, a5, a6, a7, CGColorSpace, DynamicRange, &v21);
  }
  PCCFRef<CGColorSpace *>::~PCCFRef(&v23._pcColorDesc._colorSpaceRef._obj);
  PCCFRef<CGColorSpace *>::~PCCFRef(&v22._pcColorDesc._colorSpaceRef._obj);
}

- (void)setColorFromFxPlugColorSpace:(void *)a3 red:(float)a4 green:(float)a5 blue:(float)a6 alpha:(float)a7
{
  if (self)
  {
    [(OZFxPlugParameterHandler *)self getColorTransformInfo];
  }
  else
  {
    memset(&v22, 0, sizeof(v22));
    memset(&v21, 0, sizeof(v21));
  }
  CGColorSpace = (CGColorSpace *)FxColorDescription::getCGColorSpace(&v22);
  int DynamicRange = FxColorDescription::getDynamicRange(&v22);
  if (FxColorDescription::isDynamicRangeManaged(&v21)) {
    ToneMapMethod = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v21);
  }
  else {
    ToneMapMethod = (PCToneMapMethod *)&kPCNoToneMapMethod;
  }
  PCToneMapMethod v20 = *ToneMapMethod;
  if (FxColorDescription::isHDR(&v21) && FxColorDescription::isSDR(&v22))
  {
    int v15 = PCGetNCLCColorSpace((unsigned int *)&kPCNCLC_Rec2020Linear);
    unint64_t v18 = __PAIR64__(LODWORD(a5), LODWORD(a4));
    float v19 = a6;
    uint64_t v16 = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v22);
    PCColorUtil::transform(v16, (uint64_t *)&v18, (uint64_t)CGColorSpace, DynamicRange, (uint64_t)v15, 1, (uint64_t)&v17);
    PCColor::setRGBA((int *)a3, v15, 1, &v20, a4, a5, a6, a7);
  }
  else
  {
    PCColor::setRGBA((int *)a3, CGColorSpace, DynamicRange, &v20, a4, a5, a6, a7);
  }
  PCCFRef<CGColorSpace *>::~PCCFRef(&v22._pcColorDesc._colorSpaceRef._obj);
  PCCFRef<CGColorSpace *>::~PCCFRef(&v21._pcColorDesc._colorSpaceRef._obj);
}

- (BOOL)addColorParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultRed:(double)a5 defaultGreen:(double)a6 defaultBlue:(double)a7 parmFlags:(unsigned int)a8
{
  if ([(OZFxPlugParameterHandler *)self hasValidParameterID:*(void *)&a4 checkMix:1 checkSpecialCheckboxIDs:1])
  {
    operator new();
  }
  return 0;
}

- (BOOL)addColorParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultRed:(double)a5 defaultGreen:(double)a6 defaultBlue:(double)a7 defaultAlpha:(double)a8 parmFlags:(unsigned int)a9
{
  if ([(OZFxPlugParameterHandler *)self hasValidParameterID:*(void *)&a4 checkMix:1 checkSpecialCheckboxIDs:1])
  {
    operator new();
  }
  return 0;
}

- (BOOL)addPointParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultX:(double)a5 defaultY:(double)a6 parmFlags:(unsigned int)a7
{
  LODWORD(v8) = a4;
  if (-[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(void *)&a4, 1, 1, v8))
  {
    operator new();
  }
  return 0;
}

- (BOOL)add2DVectorWithName:(id)a3 parmId:(unsigned int)a4 defaultX:(double)a5 defaultY:(double)a6 parmFlags:(unsigned int)a7
{
  LODWORD(v8) = a4;
  if (-[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(void *)&a4, 1, 1, v8))
  {
    operator new();
  }
  return 0;
}

- (BOOL)add2DScaleWithName:(id)a3 parmId:(unsigned int)a4 defaultX:(double)a5 defaultY:(double)a6 parmFlags:(unsigned int)a7
{
  LODWORD(v8) = a4;
  if (-[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(void *)&a4, 1, 1, v8))
  {
    operator new();
  }
  return 0;
}

- (BOOL)addPopupMenuWithNameAndTags:(id)a3 parmId:(unsigned int)a4 defaultValue:(unsigned int)a5 menuEntries:(id)a6 tags:(const int *)a7 tagCount:(int)a8 parmFlags:(unsigned int)a9
{
  if ([(OZFxPlugParameterHandler *)self hasValidParameterID:*(void *)&a4 checkMix:1 checkSpecialCheckboxIDs:1])
  {
    [a6 componentsJoinedByString:@"|"];
    operator new();
  }
  return 0;
}

- (BOOL)addPopupMenuWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(unsigned int)a5 menuEntries:(id)a6 parmFlags:(unsigned int)a7
{
  LODWORD(v8) = a7;
  return [(OZFxPlugParameterHandler *)self addPopupMenuWithNameAndTags:a3 parmId:*(void *)&a4 defaultValue:*(void *)&a5 menuEntries:a6 tags:0 tagCount:0 parmFlags:v8];
}

- (BOOL)addImageReferenceWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  LODWORD(v6) = a4;
  if (-[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(void *)&a4, 1, 1, v6))
  {
    operator new();
  }
  return 0;
}

- (BOOL)addCustomParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(id)a5 parmFlags:(unsigned int)a6
{
  unsigned int v26 = a4;
  BOOL v8 = [(OZFxPlugParameterHandler *)self hasValidParameterID:*(void *)&a4 checkMix:1 checkSpecialCheckboxIDs:1];
  if (v8)
  {
    cntrl = self->_fxPlugLock.__cntrl_;
    ptr = self->_fxPlugLock.__ptr_;
    uint64_t v24 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v25, (uint64_t)&ptr);
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v24);
    }
    uint64_t v10 = *(void *)v25[0];
    if (!*(void *)v25[0]) {
      goto LABEL_18;
    }
    unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
    if (v11) {
      goto LABEL_18;
    }
    unsigned int v12 = v26;
    BOOL v13 = v26 == 8888 && [(OZFxPlugParameterHandler *)self isColorCorrection];
    int v14 = *(unsigned __int8 *)(v10 + 216);
    OZFxPlugSharedBase::isXPCBasedPlugin((OZFxPlugSharedBase *)v10);
    if (a5 && !v14)
    {
      int v15 = *(void **)(v10 + 24);
      char v16 = [v15 useLegacyCoding];
      if (v15) {
        char v17 = v16;
      }
      else {
        char v17 = 1;
      }
      if (v17)
      {
        if (!v15)
        {
LABEL_18:
          OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v25);
          LOBYTE(v8) = 0;
          return v8;
        }
      }
      else
      {
        unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
        [v18 encodeObject:a5 forKey:@"Custom Data"];
        [v18 encodedData];
      }
    }
    if (v13)
    {
      if (atomic_load_explicit((atomic_ullong *volatile)&-[OZFxPlugParameterHandler addCustomParameterWithName:parmId:defaultValue:parmFlags:]::once, memory_order_acquire) != -1)
      {
        v20.var0 = (__CFString *)&v22;
        v27.var0 = (__CFString *)&v20;
        std::__call_once(&-[OZFxPlugParameterHandler addCustomParameterWithName:parmId:defaultValue:parmFlags:]::once, &v27, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[OZFxPlugParameterHandler addCustomParameterWithName:parmId:defaultValue:parmFlags:]::$_0 &&>>);
      }
      operator new();
    }
    v20.var0 = (__CFString *)v12;
    FxColorDescription v21 = [(OZFxPlugParameterHandler *)self getScene];
    [MEMORY[0x1E4F1C9B8] dataWithBytes:&v20 length:16];
    operator new();
  }
  return v8;
}

- (BOOL)setCustomParameterDefaultValue:(id)a3 parmId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v7 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v7)
  {
    channelMap = self->_channelMap;
    unsigned __int8 v11 = (char *)channelMap[1];
    uint64_t v9 = (char *)(channelMap + 1);
    uint64_t v10 = v11;
    if (v11)
    {
      unsigned int v12 = v9;
      do
      {
        unsigned int v13 = *((_DWORD *)v10 + 8);
        BOOL v14 = v13 >= v4;
        if (v13 >= v4) {
          int v15 = (char **)v10;
        }
        else {
          int v15 = (char **)(v10 + 8);
        }
        if (v14) {
          unsigned int v12 = v10;
        }
        uint64_t v10 = *v15;
      }
      while (*v15);
      if (v12 != v9 && *((_DWORD *)v12 + 8) <= v4)
      {
        char v16 = (OZChannelBlindData *)*((void *)v12 + 5);
        cntrl = self->_fxPlugLock.__cntrl_;
        ptr = self->_fxPlugLock.__ptr_;
        uint64_t v24 = cntrl;
        if (cntrl) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
        }
        OZFxPlugLockSentinel::OZFxPlugLockSentinel(v25, (uint64_t)&ptr);
        if (v24) {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v24);
        }
        uint64_t v18 = *(void *)v25[0];
        if (*(void *)v25[0])
        {
          unsigned __int8 v19 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
          if ((v19 & 1) == 0)
          {
            if (!a3 || *(unsigned char *)(v18 + 216))
            {
LABEL_24:
              OZChannelBlindData::setDefaultValue(v16, a3);
              [(OZFxPlugParameterHandler *)self _updateUIForParm:v4];
              OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v25);
              LOBYTE(v7) = 1;
              return v7;
            }
            PCString v20 = *(void **)(v18 + 24);
            if (v20)
            {
              if ((objc_msgSend(v20, "useLegacyCoding", ptr) & 1) == 0)
              {
                FxColorDescription v21 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
                [v21 encodeObject:a3 forKey:@"Custom Data"];
                a3 = (id)[v21 encodedData];
              }
              goto LABEL_24;
            }
          }
        }
        OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v25);
      }
    }
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)startParameterSubGroup:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  if ([(OZFxPlugParameterHandler *)self hasValidParameterID:*(void *)&a4 checkMix:1 checkSpecialCheckboxIDs:1])
  {
    operator new();
  }
  return 0;
}

- (BOOL)endParameterSubGroup
{
  folderStack = self->_folderStack;
  --folderStack[5];
  std::deque<unsigned long>::__maybe_remove_back_spare[abi:ne180100](folderStack, 1);
  return 1;
}

- (BOOL)addLevelsWithName:(id)a3 parmId:(unsigned int)a4 hideGamma:(BOOL)a5 parmFlags:(unsigned int)a6
{
  LODWORD(v7) = a4;
  if (-[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(void *)&a4, 1, 1, v7))
  {
    operator new();
  }
  return 0;
}

- (BOOL)addHistogramWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  LODWORD(v6) = a4;
  if (-[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(void *)&a4, 1, 1, v6))
  {
    operator new();
  }
  return 0;
}

- (BOOL)addGradientWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  LODWORD(v6) = a4;
  if (-[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(void *)&a4, 1, 1, v6))
  {
    operator new();
  }
  return 0;
}

- (BOOL)addGradientPositionedWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  LODWORD(v6) = a4;
  if (-[OZFxPlugParameterHandler hasValidParameterID:checkMix:checkSpecialCheckboxIDs:](self, "hasValidParameterID:checkMix:checkSpecialCheckboxIDs:", *(void *)&a4, 1, 1, v6))
  {
    operator new();
  }
  return 0;
}

- (BOOL)addStringParameterWithName:(id)a3 parmId:(unsigned int)a4 defaultValue:(id)a5 parmFlags:(unsigned int)a6
{
  unsigned int v11 = a4;
  if ([(OZFxPlugParameterHandler *)self hasValidParameterID:*(void *)&a4 checkMix:1 checkSpecialCheckboxIDs:1])
  {
    PCURL::PCURL((PCURL *)&v10, a3);
    PCURL::PCURL((PCURL *)&v9, a5);
    operator new();
  }
  return 0;
}

- (BOOL)addPathPickerWithName:(id)a3 parmId:(unsigned int)a4 parmFlags:(unsigned int)a5
{
  PCPrint("File %s, line %d should not have been reached:\n\t", (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7, (char)"/Library/Caches/com.apple.xbs/Sources/MotioniOS/Ozone/Effects/FxFilter/OZFxPlugParameterHandler.mm");
  pcAbortImpl();
}

- (void)preGetCMTime:(id *)a3 forChannel:(OZChannelBase *)a4 atFxTime:(id)a5
{
  if (self)
  {
    [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
  }
  else
  {
    long long v12 = 0uLL;
    int64_t v13 = 0;
  }
  *(_OWORD *)&a3->var0 = v12;
  int64_t v8 = v13;
  a3->unsigned int var3 = v13;
  long long v10 = *(_OWORD *)&a3->var0;
  int64_t v11 = v8;
  return [(OZFxPlugParameterHandler *)self beginTimingOperation:&v10 forChannel:a4];
}

- (OZChannelBase)channelForParameterID:(unsigned int)a3
{
  channelMap = self->_channelMap;
  uint64_t v6 = (char *)channelMap[1];
  uint64_t v4 = (char *)(channelMap + 1);
  uint64_t v5 = v6;
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v4;
  do
  {
    unsigned int v8 = *((_DWORD *)v5 + 8);
    BOOL v9 = v8 >= a3;
    if (v8 >= a3) {
      long long v10 = (char **)v5;
    }
    else {
      long long v10 = (char **)(v5 + 8);
    }
    if (v9) {
      uint64_t v7 = v5;
    }
    uint64_t v5 = *v10;
  }
  while (*v10);
  if (v7 != v4 && *((_DWORD *)v7 + 8) <= a3) {
    return (OZChannelBase *)*((void *)v7 + 5);
  }
  else {
    return 0;
  }
}

- (BOOL)_getFloatValue:(double *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  unsigned int v8 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a4];
  if (v8)
  {
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
    }
    else
    {
      id v14 = 0;
      memset(&v12[1], 0, sizeof(CMTime));
    }
    CMTime v13 = v12[1];
    v12[0] = v12[1];
    BOOL v9 = [(OZFxPlugParameterHandler *)self beginTimingOperation:v12 forChannel:v8];
    OZChannel::getValueAsDouble((OZChannel *)v8, &v13, 0.0);
    *(void *)a3 = v10;
    [(OZFxPlugParameterHandler *)self endTimingOperation:v9];
    ProCore_Impl::PCNSRefImpl::release(&v14);
  }
  return v8 != 0;
}

- (BOOL)_getIntValue:(int *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  unsigned int v8 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a4];
  if (v8)
  {
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
    }
    else
    {
      id v13 = 0;
      memset(&v11[1], 0, sizeof(CMTime));
    }
    CMTime v12 = v11[1];
    v11[0] = v11[1];
    BOOL v9 = [(OZFxPlugParameterHandler *)self beginTimingOperation:v11 forChannel:v8];
    *a3 = OZChannel::getValueAsInt((OZChannel *)v8, &v12, 0.0);
    [(OZFxPlugParameterHandler *)self endTimingOperation:v9];
    ProCore_Impl::PCNSRefImpl::release(&v13);
  }
  return v8 != 0;
}

- (BOOL)_getBoolValue:(BOOL *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  unsigned int v8 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a4];
  if (v8)
  {
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
    }
    else
    {
      id v13 = 0;
      memset(&v11[1], 0, sizeof(CMTime));
    }
    CMTime v12 = v11[1];
    v11[0] = v11[1];
    BOOL v9 = [(OZFxPlugParameterHandler *)self beginTimingOperation:v11 forChannel:v8];
    *a3 = OZChannel::getValueAsInt((OZChannel *)v8, &v12, 0.0) != 0;
    [(OZFxPlugParameterHandler *)self endTimingOperation:v9];
    ProCore_Impl::PCNSRefImpl::release(&v13);
  }
  return v8 != 0;
}

- (BOOL)_getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 fromParm:(unsigned int)a6 atTime:(id)a7
{
  CMTime v12 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a6];
  if (v12)
  {
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a7.var1 withConversionData:0];
    }
    else
    {
      id v23 = 0;
      memset(&v18, 0, 24);
    }
    long long v21 = *(_OWORD *)&v18.var0.var0;
    double v22 = v18.var0.var1[1];
    long long v19 = *(_OWORD *)&v18.var0.var0;
    double v20 = v18.var0.var1[1];
    id v13 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v19 forChannel:v12];
    PCColor::PCColor(&v18);
    (*((void (**)(OZChannelBase *, long long *, PCColor *))v12->var0 + 104))(v12, &v21, &v18);
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    if (OZChannelColorNoAlpha::isColor((OZChannelColorNoAlpha *)v12))
    {
      [(OZFxPlugParameterHandler *)self getColorInFxPlugColorSpace:&v18 red:(char *)&v17 + 4 green:&v17 blue:(char *)&v16 + 4 alpha:&v16];
    }
    else
    {
      CGColorSpace = PCColor::getCGColorSpace(&v18);
      PCColor::getRGBA(&v18, (float *)&v17 + 1, (float *)&v17, (float *)&v16 + 1, (float *)&v16, CGColorSpace);
    }
    *a3 = *((float *)&v17 + 1);
    *a4 = *(float *)&v17;
    *a5 = *((float *)&v16 + 1);
    [(OZFxPlugParameterHandler *)self endTimingOperation:v13];
    PCCFRef<CGColorSpace *>::~PCCFRef(&v18.var1._obj);
    ProCore_Impl::PCNSRefImpl::release(&v23);
  }
  return v12 != 0;
}

- (BOOL)_getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 alphaValue:(double *)a6 fromParm:(unsigned int)a7 atTime:(id)a8
{
  id v14 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a7];
  if (v14)
  {
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a8.var1 withConversionData:0];
    }
    else
    {
      id v25 = 0;
      memset(&v20, 0, 24);
    }
    long long v23 = *(_OWORD *)&v20.var0.var0;
    double v24 = v20.var0.var1[1];
    long long v21 = *(_OWORD *)&v20.var0.var0;
    double v22 = v20.var0.var1[1];
    int v15 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v21 forChannel:v14];
    PCColor::PCColor(&v20);
    (*((void (**)(OZChannelBase *, long long *, PCColor *))v14->var0 + 104))(v14, &v23, &v20);
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    if (OZChannelColorNoAlpha::isColor((OZChannelColorNoAlpha *)v14))
    {
      [(OZFxPlugParameterHandler *)self getColorInFxPlugColorSpace:&v20 red:(char *)&v19 + 4 green:&v19 blue:(char *)&v18 + 4 alpha:&v18];
    }
    else
    {
      CGColorSpace = PCColor::getCGColorSpace(&v20);
      PCColor::getRGBA(&v20, (float *)&v19 + 1, (float *)&v19, (float *)&v18 + 1, (float *)&v18, CGColorSpace);
    }
    *a3 = *((float *)&v19 + 1);
    *a4 = *(float *)&v19;
    *a5 = *((float *)&v18 + 1);
    *a6 = *(float *)&v18;
    [(OZFxPlugParameterHandler *)self endTimingOperation:v15];
    PCCFRef<CGColorSpace *>::~PCCFRef(&v20.var1._obj);
    ProCore_Impl::PCNSRefImpl::release(&v25);
  }
  return v14 != 0;
}

- (BOOL)_getXValue:(double *)a3 YValue:(double *)a4 fromParm:(unsigned int)a5 atTime:(id)a6
{
  uint64_t v10 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a5];
  if (v10)
  {
    int64_t v11 = v10;
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      CMTime v38 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a6.var1 withConversionData:0];
    }
    else
    {
      id v39 = 0;
      memset(v36, 0, 24);
    }
    CMTime v38 = v36[0];
    CMTime v37 = v36[0];
    id v13 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v37 forChannel:v11];
    if (a3)
    {
      OZChannel::getValueAsDouble((OZChannel *)&v11[1].var3, &v38, 0.0);
      *(void *)a3 = v14;
    }
    if (a4)
    {
      OZChannel::getValueAsDouble((OZChannel *)&v11[2].var8, &v38, 0.0);
      *(void *)a4 = v15;
    }
    if ([(OZFxPlugParameterHandler *)self shouldFlipPoints]) {
      *a4 = 1.0 - *a4;
    }
    if (![(OZFxPlugParameterHandler *)self useAbsolutePoints]) {
      goto LABEL_28;
    }
    OZRenderParams::OZRenderParams((OZRenderParams *)v36);
    cntrl = self->_fxPlugLock.__cntrl_;
    ptr = self->_fxPlugLock.__ptr_;
    int v34 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v35, (uint64_t)&ptr);
    if (v34) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v34);
    }
    uint64_t v17 = *(const void **)v35[0];
    if (!*(void *)v35[0] || (unsigned __int8 v18 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v18 & 1) != 0))
    {
      [(OZFxPlugParameterHandler *)self endTimingOperation:v13];
    }
    else
    {
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      __asm { FMOV            V0.2D, #-1.0 }
      long long v32 = _Q0;
      if (v19)
      {
        unsigned int v26 = (void (**)(void *, uint64_t *, CMTime *))(*v19 + 1488);
        PCColor v20 = v19;
LABEL_25:
        (*v26)(v20, &v30, v36);
        int v27 = 0;
        double v28 = *((double *)&v32 + 1);
        *a3 = *a3 / *(double *)&v32 + 0.5;
        *a4 = *a4 / v28 + 0.5;
LABEL_26:
        OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v35);
        OZRenderParams::~OZRenderParams((OZRenderParams *)v36);
        if (v27)
        {
          BOOL v12 = 0;
LABEL_29:
          ProCore_Impl::PCNSRefImpl::release(&v39);
          return v12;
        }
LABEL_28:
        -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v13, v30, v31);
        BOOL v12 = 1;
        goto LABEL_29;
      }
      if (v20)
      {
        unsigned int v26 = (void (**)(void *, uint64_t *, CMTime *))(*v20 + 16);
        goto LABEL_25;
      }
      -[OZFxPlugParameterHandler endTimingOperation:](self, "endTimingOperation:", v13, v30, v31);
    }
    int v27 = 1;
    goto LABEL_26;
  }
  return 0;
}

- (BOOL)_getAngle:(double *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  unsigned int v8 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a4];
  if (v8)
  {
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
    }
    else
    {
      id v14 = 0;
      memset(&v12[1], 0, sizeof(CMTime));
    }
    CMTime v13 = v12[1];
    v12[0] = v12[1];
    BOOL v9 = [(OZFxPlugParameterHandler *)self beginTimingOperation:v12 forChannel:v8];
    OZChannel::getValueAsDouble((OZChannel *)v8, &v13, 0.0);
    *a3 = v10 * 57.2957795;
    [(OZFxPlugParameterHandler *)self endTimingOperation:v9];
    ProCore_Impl::PCNSRefImpl::release(&v14);
  }
  return v8 != 0;
}

- (BOOL)retrieveImage:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(id)a8 retriever:(SEL)a9 ARGB:(BOOL)a10 imageType:(unint64_t)a11 forAnalysis:(BOOL)a12
{
  if (!self->_appTerminating)
  {
    *a3 = 0;
    BOOL v12 = [(OZFxPlugParameterHandler *)self _setupRenderer];
    if (!v12) {
      return v12;
    }
    channelMap = self->_channelMap;
    PCColor v20 = (char *)channelMap[1];
    unsigned __int8 v18 = (char *)(channelMap + 1);
    uint64_t v19 = v20;
    if (!v20) {
      goto LABEL_15;
    }
    long long v21 = v18;
    do
    {
      unsigned int v22 = *((_DWORD *)v19 + 8);
      BOOL v23 = v22 >= a7;
      if (v22 >= a7) {
        double v24 = (char **)v19;
      }
      else {
        double v24 = (char **)(v19 + 8);
      }
      if (v23) {
        long long v21 = v19;
      }
      uint64_t v19 = *v24;
    }
    while (*v24);
    if (v21 == v18 || *((_DWORD *)v21 + 8) > a7)
    {
LABEL_15:
      LOBYTE(v12) = 1;
      return v12;
    }
    id v25 = (OZChannel *)*((void *)v21 + 5);
    unsigned int v26 = [(OZFxPlugParameterHandler *)self getScene];
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      memset(&v44, 0, sizeof(v44));
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a8.var1 withConversionData:0];
    }
    else
    {
      id v45 = 0;
      memset(&v44, 0, sizeof(v44));
    }
    CMTime v43 = v44;
    int v27 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v43 forChannel:v25];
    unsigned int ValueAsUint = OZChannel::getValueAsUint(v25, &v44, 0.0);
    if (v26)
    {
      Node = OZScene::getNode(v26, ValueAsUint);
      uint64_t v30 = Node;
      if (Node)
      {
        if (v32)
        {
          if (v33) {
            OZImageElement::isDropZone(v33);
          }
          goto LABEL_26;
        }
        if (v31)
        {
LABEL_26:
          cntrl = self->_fxPlugLock.__cntrl_;
          ptr = self->_fxPlugLock.__ptr_;
          v41 = cntrl;
          if (cntrl) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
          }
          OZFxPlugLockSentinel::OZFxPlugLockSentinel(v42, (uint64_t)&ptr);
          if (v41) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v41);
          }
          if (*(void *)v42[0])
          {
            RenderParams = (const OZRenderParams *)OZFxPlugRenderContextManager::getRenderParams(&self->_threadContextManager, *(OZFxPlugSharedBase **)v42[0]);
            OZRenderParams::OZRenderParams((OZRenderParams *)v39, RenderParams);
            OZFxPlugSharedBase::setupRenderParamsForRetrievingImage((OZFxPlugSharedBase *)v39, (OZRenderParams *)a6, v30, (OZSceneNode *)&v44, (const CMTime *)self->_renderer, v36);
          }
          [(OZFxPlugParameterHandler *)self endTimingOperation:v27];
          OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v42);
          char v37 = 0;
LABEL_33:
          ProCore_Impl::PCNSRefImpl::release(&v45);
          LOBYTE(v12) = 1;
          if (v37) {
            return v12;
          }
          goto LABEL_2;
        }
      }
    }
    [(OZFxPlugParameterHandler *)self endTimingOperation:v27];
    char v37 = 1;
    goto LABEL_33;
  }
LABEL_2:
  LOBYTE(v12) = 0;
  return v12;
}

- (BOOL)imageSize:(CGSize *)a3 fromParameter:(unsigned int)a4 atTime:(id *)a5
{
  return 0;
}

- (BOOL)getBitmap:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(double)a8
{
  long long v8 = *(_OWORD *)&a6->var2;
  v12[0] = *(_OWORD *)&a6->var0.var0;
  v12[1] = v8;
  CMTime v12[2] = *(_OWORD *)&a6->var4;
  LOBYTE(v11) = 0;
  LOBYTE(v10) = 1;
  return [(OZFxPlugParameterHandler *)self retrieveImage:a3 layerOffsetX:a4 layerOffsetY:a5 requestInfo:v12 fromParm:*(void *)&a7 atTime:*(void *)&a8 retriever:sel_textureRetriever_ ARGB:v10 imageType:1 forAnalysis:v11];
}

- (BOOL)getTexture:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(double)a8
{
  long long v8 = *(_OWORD *)&a6->var2;
  v12[0] = *(_OWORD *)&a6->var0.var0;
  v12[1] = v8;
  CMTime v12[2] = *(_OWORD *)&a6->var4;
  LOBYTE(v11) = 0;
  LOBYTE(v10) = 1;
  return [(OZFxPlugParameterHandler *)self retrieveImage:a3 layerOffsetX:a4 layerOffsetY:a5 requestInfo:v12 fromParm:*(void *)&a7 atTime:*(void *)&a8 retriever:sel_textureRetriever_ ARGB:v10 imageType:2 forAnalysis:v11];
}

- (BOOL)getAnalysisTexture:(id *)a3 requestInfo:(id *)a4 fromParm:(unsigned int)a5 atFxTime:(id)a6
{
  long long v6 = *(_OWORD *)&a4->var2;
  v10[0] = *(_OWORD *)&a4->var0.var0;
  v10[1] = v6;
  v10[2] = *(_OWORD *)&a4->var4;
  LOBYTE(v9) = 1;
  LOBYTE(v8) = 1;
  return [(OZFxPlugParameterHandler *)self retrieveImage:a3 layerOffsetX:0 layerOffsetY:0 requestInfo:v10 fromParm:*(void *)&a5 atTime:a6.var1 retriever:sel_textureRetriever_ ARGB:v8 imageType:2 forAnalysis:v9];
}

- (void)setAgent:(void *)a3 toScaleTo:(const void *)a4
{
  uint64_t v5 = *((void *)a4 + 1);
  uint64_t v6 = *(void *)a4;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v9 = v5;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v12 = 0x3FF0000000000000;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v15 = 0x3FF0000000000000;
  LiRenderingTechnology::setEnableMetalRendering((uint64_t)a3, 0);
  LiAgent::setImageSpace((uint64_t)a3, 0);
  LiAgent::setPixelTransform((uint64_t)a3, (uint64_t)&v6);
}

- (BOOL)getHeliumImage:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(unsigned int)a7 atTime:(id)a8
{
  *a3 = 0;
  if ([(OZFxPlugParameterHandler *)self _setupRenderer] && !self->_appTerminating)
  {
    char UseLiEdgeTextureNodeCache = getUseLiEdgeTextureNodeCache();
    setUseLiEdgeTextureNodeCache(0);
    channelMap = self->_channelMap;
    uint64_t v17 = (char *)channelMap[1];
    uint64_t v15 = (char *)(channelMap + 1);
    uint64_t v16 = v17;
    if (!v17) {
      goto LABEL_16;
    }
    unsigned __int8 v18 = v15;
    do
    {
      unsigned int v19 = *((_DWORD *)v16 + 8);
      BOOL v20 = v19 >= a7;
      if (v19 >= a7) {
        long long v21 = (char **)v16;
      }
      else {
        long long v21 = (char **)(v16 + 8);
      }
      if (v20) {
        unsigned __int8 v18 = v16;
      }
      uint64_t v16 = *v21;
    }
    while (*v21);
    if (v18 == v15 || *((_DWORD *)v18 + 8) > a7)
    {
LABEL_16:
      BOOL v12 = 1;
LABEL_17:
      setUseLiEdgeTextureNodeCache(UseLiEdgeTextureNodeCache);
      return v12;
    }
    unsigned int v22 = (OZChannel *)*((void *)v18 + 5);
    BOOL v23 = [(OZFxPlugParameterHandler *)self getScene];
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      memset(&v40, 0, sizeof(v40));
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a8.var1 withConversionData:0];
    }
    else
    {
      id v41 = 0;
      memset(&v40, 0, sizeof(v40));
    }
    CMTime v39 = v40;
    double v24 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v39 forChannel:v22];
    unsigned int ValueAsUint = OZChannel::getValueAsUint(v22, &v40, 0.0);
    if (v23)
    {
      Node = OZScene::getNode(v23, ValueAsUint);
      int v27 = Node;
      if (Node)
      {
        if (v29)
        {
          if (v30) {
            OZImageElement::isDropZone(v30);
          }
          goto LABEL_27;
        }
        if (v28)
        {
LABEL_27:
          cntrl = self->_fxPlugLock.__cntrl_;
          ptr = self->_fxPlugLock.__ptr_;
          char v37 = cntrl;
          if (cntrl) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
          }
          OZFxPlugLockSentinel::OZFxPlugLockSentinel(v38, (uint64_t)&ptr);
          if (v37) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v37);
          }
          if (*(void *)v38[0])
          {
            RenderParams = (const OZRenderParams *)OZFxPlugRenderContextManager::getRenderParams(&self->_threadContextManager, *(OZFxPlugSharedBase **)v38[0]);
            OZRenderParams::OZRenderParams((OZRenderParams *)v35, RenderParams);
            OZFxPlugSharedBase::setupRenderParamsForRetrievingImage((OZFxPlugSharedBase *)v35, (OZRenderParams *)a6, v27, (OZSceneNode *)&v40, (const CMTime *)self->_renderer, v33);
          }
          [(OZFxPlugParameterHandler *)self endTimingOperation:v24];
          OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v38);
          char v34 = 0;
          goto LABEL_34;
        }
      }
    }
    [(OZFxPlugParameterHandler *)self endTimingOperation:v24];
    char v34 = 1;
LABEL_34:
    ProCore_Impl::PCNSRefImpl::release(&v41);
    BOOL v12 = (v34 & 1) != 0;
    goto LABEL_17;
  }
  return 0;
}

- (BOOL)getCustomParameterValue:(id *)a3 fromParm:(unsigned int)a4
{
  uint64_t v6 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a4];
  if (v6)
  {
    if (self) {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
    }
    else {
      id v8 = 0;
    }
    *a3 = OZChannelBlindData::getPluginDataPtr((OZChannelBlindData *)v6, MEMORY[0x1E4F1FA48]);
    ProCore_Impl::PCNSRefImpl::release(&v8);
  }
  return v6 != 0;
}

- (BOOL)_getCustomParameterValue:(id *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v9 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a4];
  if (!v9) {
    return 0;
  }
  long long v10 = (OZChannelBlindData *)v9;
  if (self) {
    [(OZFxPlugParameterHandler *)self motionEffectRef];
  }
  else {
    id v28 = 0;
  }
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  unsigned int v26 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v27, (uint64_t)&ptr);
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v26);
  }
  uint64_t v13 = *(void *)v27[0];
  if (!*(void *)v27[0] || (unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v14 & 1) != 0))
  {
    BOOL v11 = 0;
  }
  else
  {
    CMTime v24 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
    CMTime v24 = v23;
    CMTime v22 = v23;
    uint64_t v15 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v22 forChannel:v10];
    PluginDataPtr = OZChannelBlindData::getPluginDataPtr(v10, &v24);
    *a3 = PluginDataPtr;
    BOOL v11 = 1;
    if (!*(unsigned char *)(v13 + 216) && PluginDataPtr)
    {
      uint64_t v17 = *(void **)(v13 + 24);
      if (v17)
      {
        if (([v17 useLegacyCoding] & 1) == 0)
        {
          v23.value = 0;
          unsigned __int8 v18 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:*a3 error:&v23];
          if (!v18)
          {
            unsigned int v19 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v20 = [(id)v23.value localizedFailureReason];
            [v19 raise:*MEMORY[0x1E4F1C4A0], @"%@", v20 format];
          }
          *a3 = (id)objc_msgSend(v18, "decodeObjectOfClass:forKey:", objc_msgSend(*(id *)(v13 + 24), "classForCustomParameterID:", v6), @"Custom Data");
          BOOL v11 = 1;
        }
      }
      else
      {
        BOOL v11 = 0;
        *a3 = 0;
      }
    }
    [(OZFxPlugParameterHandler *)self endTimingOperation:v15];
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v27);
  ProCore_Impl::PCNSRefImpl::release(&v28);
  return v11;
}

- (id)decodeLegacyData:(id)a3 forParameterID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v13 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v14, (uint64_t)&ptr);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v13);
  }
  if (*(void *)v14[0]
    && (unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v8 & 1) == 0)
    && (uint64_t v9 = *(void **)(*(void *)v14[0] + 24), (objc_opt_respondsToSelector() & 1) != 0))
  {
    long long v10 = objc_msgSend(v9, "decodeLegacyData:forParameterID:", a3, v4, ptr);
  }
  else
  {
    long long v10 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v14);
  return v10;
}

- (BOOL)getFloatValue:(double *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return [(OZFxPlugParameterHandler *)self _getFloatValue:a3 fromParm:*(void *)&a4 atTime:*(void *)&a5];
}

- (BOOL)getIntValue:(int *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return [(OZFxPlugParameterHandler *)self _getIntValue:a3 fromParm:*(void *)&a4 atTime:*(void *)&a5];
}

- (BOOL)getBoolValue:(BOOL *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return [(OZFxPlugParameterHandler *)self _getBoolValue:a3 fromParm:*(void *)&a4 atTime:*(void *)&a5];
}

- (BOOL)getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 fromParm:(unsigned int)a6 atTime:(double)a7
{
  return [(OZFxPlugParameterHandler *)self _getRedValue:a3 greenValue:a4 blueValue:a5 fromParm:*(void *)&a6 atTime:*(void *)&a7];
}

- (BOOL)getRedValue:(double *)a3 greenValue:(double *)a4 blueValue:(double *)a5 alphaValue:(double *)a6 fromParm:(unsigned int)a7 atTime:(double)a8
{
  return [(OZFxPlugParameterHandler *)self _getRedValue:a3 greenValue:a4 blueValue:a5 alphaValue:a6 fromParm:*(void *)&a7 atTime:*(void *)&a8];
}

- (BOOL)getXValue:(double *)a3 YValue:(double *)a4 fromParm:(unsigned int)a5 atTime:(double)a6
{
  return [(OZFxPlugParameterHandler *)self _getXValue:a3 YValue:a4 fromParm:*(void *)&a5 atTime:*(void *)&a6];
}

- (BOOL)getCustomParameterValue:(id *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return [(OZFxPlugParameterHandler *)self _getCustomParameterValue:a3 fromParm:*(void *)&a4 atTime:*(void *)&a5];
}

- (BOOL)getPathID:(void *)a3 fromParm:(unsigned int)a4 atTime:(double)a5
{
  return [(OZFxPlugParameterHandler *)self _getPathID:a3 fromParm:*(void *)&a4 atTime:*(void *)&a5];
}

- (BOOL)_getHistogramBlackIn:(double *)a3 BlackOut:(double *)a4 WhiteIn:(double *)a5 WhiteOut:(double *)a6 Gamma:(double *)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(id)a10
{
  int v10 = a8;
  uint64_t v17 = [(OZFxPlugParameterHandler *)self channelForParameterID:a9];
  if (v17)
  {
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a10.var1 withConversionData:0];
    }
    else
    {
      id v27 = 0;
      memset(&v25[1], 0, sizeof(CMTime));
    }
    CMTime v26 = v25[1];
    v25[0] = v25[1];
    unsigned __int8 v18 = [(OZFxPlugParameterHandler *)self beginTimingOperation:v25 forChannel:v17];
    OZChannelHistogram::getBlackInValue((OZChannelHistogram *)v17, v10, &v26, 0.0);
    *(void *)a3 = v19;
    OZChannelHistogram::getBlackOutValue((OZChannelHistogram *)v17, v10, &v26, 0.0);
    *(void *)a4 = v20;
    OZChannelHistogram::getWhiteInValue((OZChannelHistogram *)v17, v10, &v26, 0.0);
    *(void *)a5 = v21;
    OZChannelHistogram::getWhiteOutValue((OZChannelHistogram *)v17, v10, &v26, 0.0);
    *(void *)a6 = v22;
    OZChannelHistogram::getGammaValue((OZChannelHistogram *)v17, v10, &v26, 0.0);
    *(void *)a7 = v23;
    [(OZFxPlugParameterHandler *)self endTimingOperation:v18];
    ProCore_Impl::PCNSRefImpl::release(&v27);
  }
  return v17 != 0;
}

- (BOOL)getHistogramBlackIn:(double *)a3 BlackOut:(double *)a4 WhiteIn:(double *)a5 WhiteOut:(double *)a6 Gamma:(double *)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(double)a10
{
  LODWORD(v11) = a9;
  return [(OZFxPlugParameterHandler *)self _getHistogramBlackIn:a3 BlackOut:a4 WhiteIn:a5 WhiteOut:a6 Gamma:a7 forChannel:a8 fromParm:v11 atTime:*(void *)&a10];
}

- (BOOL)getLevelsBlack:(double *)a3 White:(double *)a4 Gamma:(double *)a5 fromParm:(unsigned int)a6 atTime:(id)a7
{
  BOOL v12 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a6];
  if (v12)
  {
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a7.var1 withConversionData:0];
    }
    else
    {
      id v20 = 0;
      memset(&v18[1], 0, sizeof(CMTime));
    }
    CMTime v19 = v18[1];
    v18[0] = v18[1];
    uint64_t v13 = [(OZFxPlugParameterHandler *)self beginTimingOperation:v18 forChannel:v12];
    OZChannelLevels::getBlackValue((OZChannelLevels *)v12, &v19, 0.0);
    *(void *)a3 = v14;
    OZChannelLevels::getWhiteValue((OZChannelLevels *)v12, &v19, 0.0);
    *(void *)a4 = v15;
    OZChannelLevels::getGammaValue((OZChannelLevels *)v12, &v19, 0.0);
    *(void *)a5 = v16;
    [(OZFxPlugParameterHandler *)self endTimingOperation:v13];
    ProCore_Impl::PCNSRefImpl::release(&v20);
  }
  return v12 != 0;
}

- (BOOL)_getGradientSamples:(void *)a3 numSamples:(unint64_t)a4 depth:(unint64_t)a5 fromParm:(unsigned int)a6 atTime:(id)a7
{
  long long v7 = self;
  LOBYTE(self) = 0;
  if (a5 <= 0x20 && ((1 << a5) & 0x100010116) != 0)
  {
    self = [(OZFxPlugParameterHandler *)v7 channelForParameterID:*(void *)&a6];
    if (self)
    {
      BOOL v12 = (uint64_t **)self;
      if (v7)
      {
        [(OZFxPlugParameterHandler *)v7 motionEffectRef];
        CMTime pcColorDesc = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
        [(OZFxPlugParameterHandler *)v7 fxTimeToFigTime:a7.var1 withConversionData:0];
      }
      else
      {
        id v57 = 0;
        memset(&v52, 0, 24);
      }
      CMTime pcColorDesc = (CMTime)v52._pcColorDesc;
      long long v54 = *(_OWORD *)&v52._pcColorDesc._colorSpaceRef._obj;
      uint64_t v55 = *(void *)&v52._pcColorDesc._toneMapMethod._gain;
      uint64_t v37 = [(OZFxPlugParameterHandler *)v7 beginTimingOperation:&v54 forChannel:v12];
      if (v7)
      {
        [(OZFxPlugParameterHandler *)v7 getColorTransformInfo];
      }
      else
      {
        memset(&v53, 0, sizeof(v53));
        memset(&v52, 0, sizeof(v52));
      }
      CGColorSpace = (CGColorSpace *)FxColorDescription::getCGColorSpace(&v53);
      int DynamicRange = FxColorDescription::getDynamicRange(&v53);
      if (FxColorDescription::isDynamicRangeManaged(&v52)) {
        ToneMapMethod = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v52);
      }
      else {
        ToneMapMethod = (PCToneMapMethod *)&kPCNoToneMapMethod;
      }
      PCToneMapMethod v51 = *ToneMapMethod;
      if (FxColorDescription::isHDR(&v52)) {
        int isSDR = FxColorDescription::isSDR(&v53);
      }
      else {
        int isSDR = 0;
      }
      std::vector<float>::vector(&v49, 4 * a4);
      if (isSDR)
      {
        uint64_t v17 = PCGetNCLCColorSpace((unsigned int *)&kPCNCLC_Rec2020Linear);
        std::vector<float>::vector(__p, 4 * a4);
        OZChannelGradient::getGradient(v12, &pcColorDesc, v17, (uint64_t)__p[0], a4, 1, &v51);
        unint64_t v43 = a4;
        CMTime v44 = __p[0];
        uint64_t v45 = 4;
        uint64_t v46 = v17;
        uint64_t v47 = 0x100000001;
        unint64_t v38 = a4;
        CMTime v39 = v49;
        uint64_t v40 = 4;
        id v41 = CGColorSpace;
        LODWORD(v42) = 1;
        HIDWORD(v42) = DynamicRange;
        unsigned __int8 v18 = (PCToneMapMethod *)FxColorDescription::getToneMapMethod(&v53);
        PCColorUtil::transformColorWithDynamicRange((uint64_t)&v43, (uint64_t)&v38, v18);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        OZChannelGradient::getGradient(v12, &pcColorDesc, CGColorSpace, (uint64_t)v49, a4, DynamicRange, &v51);
      }
      switch(a5)
      {
        case 1uLL:
        case 8uLL:
          CMTime v19 = (float *)v49;
          if (v50 != v49)
          {
            uint64_t v20 = (v50 - (unsigned char *)v49) >> 2;
            do
            {
              float v21 = *v19++;
              float v22 = v21;
              float v23 = 255.0;
              float v24 = v21 * 255.0;
              if (v21 <= 1.0) {
                float v23 = v24;
              }
              if (v22 >= 0.0) {
                float v25 = v23;
              }
              else {
                float v25 = 0.0;
              }
              *(unsigned char *)a3 = vcvtmd_s64_f64(v25 + 0.5 + 0.0000001);
              a3 = (char *)a3 + 1;
              --v20;
            }
            while (v20);
          }
          goto LABEL_44;
        case 2uLL:
          goto LABEL_36;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          goto LABEL_44;
        case 4uLL:
          goto LABEL_32;
        default:
          if (a5 == 16)
          {
LABEL_36:
            uint64_t v29 = (float *)v49;
            if (v50 != v49)
            {
              uint64_t v30 = (v50 - (unsigned char *)v49) >> 2;
              do
              {
                float v31 = *v29++;
                float v32 = v31;
                float v33 = 65536.0;
                float v34 = v31 * 65536.0;
                if (v31 <= 1.0) {
                  float v33 = v34;
                }
                if (v32 >= 0.0) {
                  float v35 = v33;
                }
                else {
                  float v35 = 0.0;
                }
                *(_WORD *)a3 = vcvtmd_s64_f64(v35 + 0.5 + 0.0000001);
                a3 = (char *)a3 + 2;
                --v30;
              }
              while (v30);
            }
          }
          else if (a5 == 32)
          {
LABEL_32:
            CMTime v26 = (int *)v49;
            if (v50 != v49)
            {
              uint64_t v27 = (v50 - (unsigned char *)v49) >> 2;
              do
              {
                int v28 = *v26++;
                *(_DWORD *)a3 = v28;
                a3 = (char *)a3 + 4;
                --v27;
              }
              while (v27);
            }
          }
LABEL_44:
          -[OZFxPlugParameterHandler endTimingOperation:](v7, "endTimingOperation:", v37, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47);
          if (v49)
          {
            v50 = v49;
            operator delete(v49);
          }
          PCCFRef<CGColorSpace *>::~PCCFRef(&v53._pcColorDesc._colorSpaceRef._obj);
          PCCFRef<CGColorSpace *>::~PCCFRef(&v52._pcColorDesc._colorSpaceRef._obj);
          ProCore_Impl::PCNSRefImpl::release(&v57);
          LOBYTE(self) = 1;
          break;
      }
    }
  }
  return (char)self;
}

- (BOOL)getGradientSamples:(void *)a3 numSamples:(unint64_t)a4 depth:(unint64_t)a5 fromParm:(unsigned int)a6 atTime:(double)a7
{
  return [(OZFxPlugParameterHandler *)self _getGradientSamples:a3 numSamples:a4 depth:a5 fromParm:*(void *)&a6 atTime:*(void *)&a7];
}

- (BOOL)getGradientStartEnd:(double *)a3 startY:(double *)a4 endX:(double *)a5 endY:(double *)a6 type:(int *)a7 fromParm:(unsigned int)a8 atTime:(id)a9
{
  uint64_t v15 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a8];
  if (v15)
  {
    if (self)
    {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
      [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a9.var1 withConversionData:0];
    }
    else
    {
      id v20 = 0;
      memset(&v18[1], 0, sizeof(CMTime));
    }
    CMTime v19 = v18[1];
    v18[0] = v18[1];
    uint64_t v16 = [(OZFxPlugParameterHandler *)self beginTimingOperation:v18 forChannel:v15];
    *a7 = OZChannel::getValueAsInt((OZChannel *)&v15[7].var2, &v19, 0.0);
    OZChannelPosition::getPosition((OZChannelPosition *)&v15[9].var6, &v19, a3, a4, 0.0);
    OZChannelPosition::getPosition((OZChannelPosition *)&v15[15].var10, &v19, a5, a6, 0.0);
    [(OZFxPlugParameterHandler *)self endTimingOperation:v16];
    ProCore_Impl::PCNSRefImpl::release(&v20);
  }
  return v15 != 0;
}

- (BOOL)getParameterFlags:(unsigned int *)a3 fromParm:(unsigned int)a4
{
  if (!a3) {
    return 0;
  }
  *a3 = 0;
  channelMap = self->_channelMap;
  uint64_t v9 = (char *)channelMap[1];
  long long v7 = (char *)(channelMap + 1);
  unsigned __int8 v8 = v9;
  if (!v9) {
    return 0;
  }
  uint64_t v11 = v7;
  do
  {
    unsigned int v12 = *((_DWORD *)v8 + 8);
    BOOL v13 = v12 >= a4;
    if (v12 >= a4) {
      uint64_t v14 = (char **)v8;
    }
    else {
      uint64_t v14 = (char **)(v8 + 8);
    }
    if (v13) {
      uint64_t v11 = v8;
    }
    unsigned __int8 v8 = *v14;
  }
  while (*v14);
  if (v11 == v7 || *((_DWORD *)v11 + 8) > a4) {
    return 0;
  }
  uint64_t v16 = *((void *)v11 + 5);
  if (!v16)
  {
    uint64_t v17 = 0;
    if (self) {
      goto LABEL_17;
    }
LABEL_19:
    id v21 = 0;
    goto LABEL_20;
  }
  if (!self) {
    goto LABEL_19;
  }
LABEL_17:
  [(OZFxPlugParameterHandler *)self motionEffectRef];
LABEL_20:
  if (((*(uint64_t (**)(uint64_t))(*(void *)v16 + 512))(v16) & 1) == 0) {
    *a3 |= 1u;
  }
  if ((~*(_DWORD *)(v16 + 56) & 0x410020) == 0) {
    *a3 |= 2u;
  }
  if (OZChannelBase::testFlag((OZChannelBase *)v16, 4)) {
    *a3 |= 4u;
  }
  if (OZChannelBase::testFlag((OZChannelBase *)v16, 8)) {
    *a3 |= 0x10u;
  }
  if (OZChannelBase::testFlag((OZChannelBase *)v16, 0x10000) && (~*(_DWORD *)(v16 + 56) & 0x410020) != 0) {
    *a3 |= 0x200u;
  }
  if (!OZChannelBase::testFlag((OZChannelBase *)v16, 16)) {
    *a3 |= 0x20u;
  }
  if (v17 && OZChannelFolder::testFoldFlag(v17, 4)) {
    *a3 |= 8u;
  }
  end = self->_fullWidthCustomParams.__end_;
  CMTime v19 = wmemchr((__int32 *)self->_fullWidthCustomParams.__begin_, a4, end - self->_fullWidthCustomParams.__begin_);
  if (v19) {
    id v20 = (unsigned int *)v19;
  }
  else {
    id v20 = end;
  }
  if (v20 != self->_fullWidthCustomParams.__end_) {
    *a3 |= 0x800u;
  }
  ProCore_Impl::PCNSRefImpl::release(&v21);
  return 1;
}

- (BOOL)getStringParameterValue:(id *)a3 fromParm:(unsigned int)a4
{
  uint64_t v6 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a4];
  if (v6)
  {
    if (self) {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
    }
    else {
      id v9 = 0;
    }
    (*((void (**)(PCString *__return_ptr, OZChannelBase *))v6->var0 + 106))(&v8, v6);
    *a3 = (id)[NSString stringWithString:PCString::ns_str(&v8)];
    PCString::~PCString(&v8);
    ProCore_Impl::PCNSRefImpl::release(&v9);
  }
  return v6 != 0;
}

- (BOOL)_getPathID:(void *)a3 fromParm:(unsigned int)a4 atTime:(id)a5
{
  long long v7 = [(OZFxPlugParameterHandler *)self channelForParameterID:*(void *)&a4];
  if (v7)
  {
    if (self) {
      [(OZFxPlugParameterHandler *)self motionEffectRef];
    }
    else {
      id v9 = 0;
    }
    *a3 = OZChanSceneNodeRef::getNode(v7);
    ProCore_Impl::PCNSRefImpl::release(&v9);
  }
  return v7 != 0;
}

- (void)abortAndWait
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v3 = [(OZFxPlugParameterHandler *)self getScene];
    if (v3)
    {
      uint64_t v4 = (OZChannelBase *)v3[188];
      if (v4)
      {
        OZChannelBase::setRangeName(v4, (const PCString *)1);
      }
    }
  }
}

- (BOOL)suppressUpdates
{
  int v3 = [MEMORY[0x1E4F29060] isMainThread];
  if (v3)
  {
    unint64_t v4 = self->_suppressChannelChangesStack.c.__size_.__value_ + self->_suppressChannelChangesStack.c.__start_ - 1;
    LOBYTE(v3) = (*(BOOL **)((char *)self->_suppressChannelChangesStack.c.__map_.__begin_
                           + ((v4 >> 9) & 0x7FFFFFFFFFFFF8)))[v4 & 0xFFF];
  }
  return v3;
}

- (BOOL)safeToSetParameters
{
  if ([MEMORY[0x1E4F29060] isMainThread]
    && ![(OZFxPlugParameterHandler *)self isRendering])
  {
    return 1;
  }
  if (!self->_showedParameterSettingWarning)
  {
    cntrl = self->_fxPlugLock.__cntrl_;
    ptr = self->_fxPlugLock.__ptr_;
    PCString v8 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    OZFxPlugLockSentinel::OZFxPlugLockSentinel(v9, (uint64_t)&ptr);
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
    }
    if (*(void *)v9[0])
    {
      OZFxPlugSharedBase::getDisplayName(*(id **)v9[0], &v6);
      unint64_t v4 = PCString::ns_str(&v6);
      PCString::~PCString(&v6);
    }
    else
    {
      unint64_t v4 = @"Unknown";
    }
    NSLog(&cfstr_ErrorInPlugin.isa, v4, @"Setting parameter values from a non-main thread is not allowed.\nPlease do not attempt to set parameter values from within -renderOutput, or\nanother method that may be called on a non-main thread.\nSetting parameters should typically be done in response to -parameterChanged, or\nin response to interactions with a custom UI or onscreen control.\nFor more information, consult the FxPlug documentation");
    self->_showedParameterSettingWarning = 1;
    OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v9);
  }
  return 0;
}

- (BOOL)_setFloatValue:(double)a3 toParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v9 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v9)
  {
    channelMap = self->_channelMap;
    BOOL v13 = (char *)channelMap[1];
    uint64_t v11 = (char *)(channelMap + 1);
    unsigned int v12 = v13;
    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v14 = v11;
    do
    {
      unsigned int v15 = *((_DWORD *)v12 + 8);
      BOOL v16 = v15 >= v6;
      if (v15 >= v6) {
        uint64_t v17 = (char **)v12;
      }
      else {
        uint64_t v17 = (char **)(v12 + 8);
      }
      if (v16) {
        uint64_t v14 = v12;
      }
      unsigned int v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *((_DWORD *)v14 + 8) <= v6)
    {
      unsigned __int8 v18 = (OZChannelBase *)*((void *)v14 + 5);
      CMTime v19 = [(OZFxPlugParameterHandler *)self getScene];
      if (v19 && !*(unsigned char *)(v19[198] + 101) && !OZChannelBase::testFlag(v18, 8))
      {
        PCSharedCount::PCSharedCount(v24);
        (*((void (**)(OZChannelBase *, PCSharedCount *))v18->var0 + 43))(v18, v24);
        PCString::~PCString((PCString *)v24);
      }
      [(OZFxPlugParameterHandler *)self preChannelChange:v18 flagsOnly:0];
      if (self)
      {
        [(OZFxPlugParameterHandler *)self motionEffectRef];
        v24[0].var0 = 0;
        v24[1].var0 = 0;
        uint64_t v25 = 0;
        [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
      }
      else
      {
        uint64_t v25 = 0;
        id v26 = 0;
        v24[0].var0 = 0;
        v24[1].var0 = 0;
      }
      long long v22 = *(_OWORD *)&v24[0].var0;
      uint64_t v23 = v25;
      id v20 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v22 forChannel:v18];
      (*((void (**)(OZChannelBase *, PCSharedCount *, BOOL, double))v18->var0 + 89))(v18, v24, [(OZFxPlugParameterHandler *)self isRendering], a3);
      [(OZFxPlugParameterHandler *)self endTimingOperation:v20];
      [(OZFxPlugParameterHandler *)self postChannelChange:v18 flagsOnly:0];
      if (self->_startActionCalled) {
        ++self->_numWriteActions;
      }
      [(OZFxPlugParameterHandler *)self _updateUIForParm:v6];
      ProCore_Impl::PCNSRefImpl::release(&v26);
      LOBYTE(v9) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)_setIntValue:(int)a3 toParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v9 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v9)
  {
    channelMap = self->_channelMap;
    BOOL v13 = (char *)channelMap[1];
    uint64_t v11 = (char *)(channelMap + 1);
    unsigned int v12 = v13;
    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v14 = v11;
    do
    {
      unsigned int v15 = *((_DWORD *)v12 + 8);
      BOOL v16 = v15 >= v6;
      if (v15 >= v6) {
        uint64_t v17 = (char **)v12;
      }
      else {
        uint64_t v17 = (char **)(v12 + 8);
      }
      if (v16) {
        uint64_t v14 = v12;
      }
      unsigned int v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *((_DWORD *)v14 + 8) <= v6)
    {
      unsigned __int8 v18 = (OZChannelBase *)*((void *)v14 + 5);
      CMTime v19 = [(OZFxPlugParameterHandler *)self getScene];
      if (v19 && !*(unsigned char *)(v19[198] + 101) && !OZChannelBase::testFlag(v18, 8))
      {
        PCSharedCount::PCSharedCount(v24);
        (*((void (**)(OZChannelBase *, PCSharedCount *))v18->var0 + 43))(v18, v24);
        PCString::~PCString((PCString *)v24);
      }
      [(OZFxPlugParameterHandler *)self preChannelChange:v18 flagsOnly:0];
      if (self)
      {
        [(OZFxPlugParameterHandler *)self motionEffectRef];
        v24[0].var0 = 0;
        v24[1].var0 = 0;
        uint64_t v25 = 0;
        [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
      }
      else
      {
        uint64_t v25 = 0;
        id v26 = 0;
        v24[0].var0 = 0;
        v24[1].var0 = 0;
      }
      long long v22 = *(_OWORD *)&v24[0].var0;
      uint64_t v23 = v25;
      id v20 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v22 forChannel:v18];
      (*((void (**)(OZChannelBase *, PCSharedCount *, BOOL, double))v18->var0 + 89))(v18, v24, [(OZFxPlugParameterHandler *)self isRendering], (double)a3);
      [(OZFxPlugParameterHandler *)self endTimingOperation:v20];
      [(OZFxPlugParameterHandler *)self postChannelChange:v18 flagsOnly:0];
      if (self->_startActionCalled) {
        ++self->_numWriteActions;
      }
      [(OZFxPlugParameterHandler *)self _updateUIForParm:v6];
      ProCore_Impl::PCNSRefImpl::release(&v26);
      LOBYTE(v9) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)_setBoolValue:(BOOL)a3 toParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  BOOL v9 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v9)
  {
    channelMap = self->_channelMap;
    BOOL v13 = (char *)channelMap[1];
    uint64_t v11 = (char *)(channelMap + 1);
    unsigned int v12 = v13;
    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v14 = v11;
    do
    {
      unsigned int v15 = *((_DWORD *)v12 + 8);
      BOOL v16 = v15 >= v6;
      if (v15 >= v6) {
        uint64_t v17 = (char **)v12;
      }
      else {
        uint64_t v17 = (char **)(v12 + 8);
      }
      if (v16) {
        uint64_t v14 = v12;
      }
      unsigned int v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *((_DWORD *)v14 + 8) <= v6)
    {
      unsigned __int8 v18 = (OZChannelBase *)*((void *)v14 + 5);
      CMTime v19 = [(OZFxPlugParameterHandler *)self getScene];
      if (v19 && !*(unsigned char *)(v19[198] + 101) && !OZChannelBase::testFlag(v18, 8))
      {
        PCSharedCount::PCSharedCount(v24);
        (*((void (**)(OZChannelBase *, PCSharedCount *))v18->var0 + 43))(v18, v24);
        PCString::~PCString((PCString *)v24);
      }
      [(OZFxPlugParameterHandler *)self preChannelChange:v18 flagsOnly:0];
      if (self)
      {
        [(OZFxPlugParameterHandler *)self motionEffectRef];
        v24[0].var0 = 0;
        v24[1].var0 = 0;
        uint64_t v25 = 0;
        [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
      }
      else
      {
        uint64_t v25 = 0;
        id v26 = 0;
        v24[0].var0 = 0;
        v24[1].var0 = 0;
      }
      long long v22 = *(_OWORD *)&v24[0].var0;
      uint64_t v23 = v25;
      id v20 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v22 forChannel:v18];
      (*((void (**)(OZChannelBase *, PCSharedCount *, BOOL, double))v18->var0 + 89))(v18, v24, [(OZFxPlugParameterHandler *)self isRendering], (double)v7);
      [(OZFxPlugParameterHandler *)self endTimingOperation:v20];
      [(OZFxPlugParameterHandler *)self postChannelChange:v18 flagsOnly:0];
      if (self->_startActionCalled) {
        ++self->_numWriteActions;
      }
      [(OZFxPlugParameterHandler *)self _updateUIForParm:v6];
      ProCore_Impl::PCNSRefImpl::release(&v26);
      LOBYTE(v9) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)_setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 toParm:(unsigned int)a6 atTime:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v13 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v13)
  {
    channelMap = self->_channelMap;
    uint64_t v17 = (char *)channelMap[1];
    unsigned int v15 = (char *)(channelMap + 1);
    BOOL v16 = v17;
    if (!v17) {
      goto LABEL_13;
    }
    unsigned __int8 v18 = v15;
    do
    {
      unsigned int v19 = *((_DWORD *)v16 + 8);
      BOOL v20 = v19 >= v8;
      if (v19 >= v8) {
        id v21 = (char **)v16;
      }
      else {
        id v21 = (char **)(v16 + 8);
      }
      if (v20) {
        unsigned __int8 v18 = v16;
      }
      BOOL v16 = *v21;
    }
    while (*v21);
    if (v18 != v15 && *((_DWORD *)v18 + 8) <= v8)
    {
      long long v22 = (OZChannelBase *)*((void *)v18 + 5);
      uint64_t v23 = [(OZFxPlugParameterHandler *)self getScene];
      if (v23 && !*(unsigned char *)(v23[198] + 101) && !OZChannelBase::testFlag(v22, 8))
      {
        PCSharedCount::PCSharedCount((PCSharedCount *)&v32);
        (*((void (**)(OZChannelBase *, PCColor *))v22->var0 + 43))(v22, &v32);
        PCString::~PCString((PCString *)&v32);
      }
      if (self)
      {
        [(OZFxPlugParameterHandler *)self motionEffectRef];
        long long v33 = 0uLL;
        uint64_t v34 = 0;
        [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a7.var1 withConversionData:0];
      }
      else
      {
        id v35 = 0;
        long long v33 = 0uLL;
        uint64_t v34 = 0;
      }
      PCColor::PCColor(&v32);
      *(float *)&double v24 = a3;
      *(float *)&double v25 = a4;
      *(float *)&double v26 = a5;
      LODWORD(v27) = 1.0;
      [(OZFxPlugParameterHandler *)self setColorFromFxPlugColorSpace:&v32 red:v24 green:v25 blue:v26 alpha:v27];
      long long v30 = v33;
      uint64_t v31 = v34;
      int v28 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v30 forChannel:v22];
      [(OZFxPlugParameterHandler *)self preChannelChange:v22 flagsOnly:0];
      (*((void (**)(OZChannelBase *, long long *, PCColor *, BOOL))v22->var0 + 105))(v22, &v33, &v32, [(OZFxPlugParameterHandler *)self isRendering]);
      [(OZFxPlugParameterHandler *)self postChannelChange:v22 flagsOnly:0];
      [(OZFxPlugParameterHandler *)self endTimingOperation:v28];
      if (self->_startActionCalled) {
        ++self->_numWriteActions;
      }
      [(OZFxPlugParameterHandler *)self _updateUIForParm:v8];
      PCCFRef<CGColorSpace *>::~PCCFRef(&v32.var1._obj);
      ProCore_Impl::PCNSRefImpl::release(&v35);
      LOBYTE(v13) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (BOOL)setRedValue:(double)a3 GreenValue:(double)a4 BlueValue:(double)a5 toParm:(unsigned int)a6 atTime:(double)a7
{
  return [(OZFxPlugParameterHandler *)self _setRedValue:*(void *)&a6 greenValue:*(void *)&a7 blueValue:a3 toParm:a4 atTime:a5];
}

- (BOOL)_setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 alphaValue:(double)a6 toParm:(unsigned int)a7 atTime:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  BOOL v15 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v15)
  {
    channelMap = self->_channelMap;
    unsigned int v19 = (char *)channelMap[1];
    uint64_t v17 = (char *)(channelMap + 1);
    unsigned __int8 v18 = v19;
    if (!v19) {
      goto LABEL_13;
    }
    BOOL v20 = v17;
    do
    {
      unsigned int v21 = *((_DWORD *)v18 + 8);
      BOOL v22 = v21 >= v9;
      if (v21 >= v9) {
        uint64_t v23 = (char **)v18;
      }
      else {
        uint64_t v23 = (char **)(v18 + 8);
      }
      if (v22) {
        BOOL v20 = v18;
      }
      unsigned __int8 v18 = *v23;
    }
    while (*v23);
    if (v20 != v17 && *((_DWORD *)v20 + 8) <= v9)
    {
      double v24 = (OZChannelBase *)*((void *)v20 + 5);
      double v25 = [(OZFxPlugParameterHandler *)self getScene];
      if (v25 && !*(unsigned char *)(v25[198] + 101) && !OZChannelBase::testFlag(v24, 8))
      {
        PCSharedCount::PCSharedCount((PCSharedCount *)&v34);
        (*((void (**)(OZChannelBase *, PCColor *))v24->var0 + 43))(v24, &v34);
        PCString::~PCString((PCString *)&v34);
      }
      if (self)
      {
        [(OZFxPlugParameterHandler *)self motionEffectRef];
        long long v35 = 0uLL;
        uint64_t v36 = 0;
        [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a8.var1 withConversionData:0];
      }
      else
      {
        id v37 = 0;
        long long v35 = 0uLL;
        uint64_t v36 = 0;
      }
      PCColor::PCColor(&v34);
      *(float *)&double v26 = a3;
      *(float *)&double v27 = a4;
      *(float *)&double v28 = a5;
      *(float *)&double v29 = a6;
      [(OZFxPlugParameterHandler *)self setColorFromFxPlugColorSpace:&v34 red:v26 green:v27 blue:v28 alpha:v29];
      long long v32 = v35;
      uint64_t v33 = v36;
      long long v30 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v32 forChannel:v24];
      [(OZFxPlugParameterHandler *)self preChannelChange:v24 flagsOnly:0];
      (*((void (**)(OZChannelBase *, long long *, PCColor *, BOOL))v24->var0 + 105))(v24, &v35, &v34, [(OZFxPlugParameterHandler *)self isRendering]);
      [(OZFxPlugParameterHandler *)self postChannelChange:v24 flagsOnly:0];
      [(OZFxPlugParameterHandler *)self endTimingOperation:v30];
      if (self->_startActionCalled) {
        ++self->_numWriteActions;
      }
      [(OZFxPlugParameterHandler *)self _updateUIForParm:v9];
      PCCFRef<CGColorSpace *>::~PCCFRef(&v34.var1._obj);
      ProCore_Impl::PCNSRefImpl::release(&v37);
      LOBYTE(v15) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (BOOL)setRedValue:(double)a3 GreenValue:(double)a4 BlueValue:(double)a5 AlphaValue:(double)a6 toParm:(unsigned int)a7 atTime:(double)a8
{
  return [(OZFxPlugParameterHandler *)self _setRedValue:*(void *)&a7 greenValue:*(void *)&a8 blueValue:a3 alphaValue:a4 toParm:a5 atTime:a6];
}

- (BOOL)_setXValue:(double)a3 YValue:(double)a4 toParm:(unsigned int)a5 atTime:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  if (![(OZFxPlugParameterHandler *)self safeToSetParameters]) {
    goto LABEL_42;
  }
  channelMap = self->_channelMap;
  uint64_t v14 = (char *)channelMap[1];
  unsigned int v12 = (char *)(channelMap + 1);
  BOOL v13 = v14;
  if (!v14) {
    goto LABEL_42;
  }
  BOOL v15 = v12;
  do
  {
    unsigned int v16 = *((_DWORD *)v13 + 8);
    _CF = v16 >= v7;
    if (v16 >= v7) {
      unsigned __int8 v18 = (char **)v13;
    }
    else {
      unsigned __int8 v18 = (char **)(v13 + 8);
    }
    if (_CF) {
      BOOL v15 = v13;
    }
    BOOL v13 = *v18;
  }
  while (*v18);
  if (v15 == v12 || *((_DWORD *)v15 + 8) > v7) {
    goto LABEL_42;
  }
  unsigned int v19 = (OZChannelBase *)*((void *)v15 + 5);
  if (self) {
    [(OZFxPlugParameterHandler *)self motionEffectRef];
  }
  else {
    id v47 = 0;
  }
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v45 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v46, (uint64_t)&ptr);
  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v45);
  }
  unsigned int v21 = *(const void **)v46[0];
  if (!*(void *)v46[0] || (unsigned __int8 v22 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v22 & 1) != 0))
  {
    char v35 = 0;
    LOBYTE(v26) = 1;
    goto LABEL_41;
  }
  memset(&v43, 0, sizeof(v43));
  [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a6.var1 withConversionData:0];
  CMTime v42 = v43;
  uint64_t v23 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v42 forChannel:v19];
  if (v24)
  {
    double v25 = v24;
    double v26 = (uint64_t *)v24[3];
    if (v26)
    {
      v41[0] = 0uLL;
      __asm { FMOV            V0.2D, #-1.0 }
      v41[1] = _Q0;
      OZRenderParams::OZRenderParams((OZRenderParams *)v38);
      v38[0]._CMTime pcColorDesc = (PCColorDescription)v43;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v31 = (OZScene *)(*(uint64_t (**)(void *))(*v25 + 296))(v25);
      WorkingColorSpace = (CGColorSpace *)OZScene::getWorkingColorSpace(v31);
      OZRenderParams::setWorkingColorSpace(v38, WorkingColorSpace);
      uint64_t v33 = *v26;
      if (v34)
      {
        if ((*(uint64_t (**)(void *, FxColorDescription *))(*(void *)v34 + 2216))(v34, v38))
        {
          OZScene::getSceneBounds((uint64_t)v31, v41);
LABEL_31:
          OZRenderParams::~OZRenderParams((OZRenderParams *)v38);
          LOBYTE(v26) = 1;
          goto LABEL_32;
        }
        uint64_t v33 = *v26;
      }
      (*(void (**)(uint64_t *, float64x2_t *, FxColorDescription *))(v33 + 80))(v26, v41, v38);
      goto LABEL_31;
    }
  }
  else
  {
    LOBYTE(v26) = 0;
  }
LABEL_32:
  if ([(OZFxPlugParameterHandler *)self shouldFlipPoints])
  {
    a4 = 1.0 - a4;
  }
  uint64_t v36 = [(OZFxPlugParameterHandler *)self getScene];
  if (v36 && !*(unsigned char *)(v36[198] + 101) && !OZChannelBase::testFlag(v19, 8))
  {
    PCSharedCount::PCSharedCount((PCSharedCount *)v38);
    (*((void (**)(OZChannelBase *, FxColorDescription *))v19->var0 + 43))(v19, v38);
    PCString::~PCString((PCString *)v38);
  }
  [(OZFxPlugParameterHandler *)self preChannelChange:v19 flagsOnly:0];
  [(OZFxPlugParameterHandler *)self isRendering];
  OZChannel2D::setValue((OZChannel2D *)v19, &v43, a3, a4);
  [(OZFxPlugParameterHandler *)self postChannelChange:v19 flagsOnly:0];
  [(OZFxPlugParameterHandler *)self endTimingOperation:v23];
  if (self->_startActionCalled) {
    ++self->_numWriteActions;
  }
  [(OZFxPlugParameterHandler *)self _updateUIForParm:v7];
  char v35 = 1;
LABEL_41:
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v46);
  ProCore_Impl::PCNSRefImpl::release(&v47);
  if ((v35 & 1) == 0) {
LABEL_42:
  }
    LOBYTE(v26) = 0;
  return (char)v26;
}

- (void)onVTBUserInteractionEventNotification:(id)a3
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v23 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v24, (uint64_t)&ptr);
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v23);
  }
  if (*(void *)v24[0])
  {
    uint64_t v5 = *(void **)(*(void *)v24[0] + 24);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = objc_msgSend(a3, "userInfo", ptr);
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"X"), "doubleValue");
      double v8 = v7;
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"Y"), "doubleValue");
      double v10 = v9;
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"VelocityX"), "doubleValue");
      double v12 = v11;
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"VelocityY"), "doubleValue");
      double v14 = v13;
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"Scale"), "doubleValue");
      double v16 = v15;
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"ScaleVelocity"), "doubleValue");
      double v18 = v17;
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"Rotation"), "doubleValue");
      double v20 = v19;
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"RotationVelocity"), "doubleValue");
      objc_msgSend(v5, "handleUIEventWithPosition:velocity:scale:scaleVelocity:rotation:rotationVelocity:", v8, 1.0 - v10, v12, -v14, v16, v18, v20, v21);
    }
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v24);
}

- (BOOL)setCustomParameterValue:(id)a3 toParm:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v7 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (!v7) {
    return v7;
  }
  channelMap = self->_channelMap;
  double v11 = (char *)channelMap[1];
  double v9 = (char *)(channelMap + 1);
  double v10 = v11;
  if (!v11) {
    goto LABEL_37;
  }
  double v12 = v9;
  do
  {
    unsigned int v13 = *((_DWORD *)v10 + 8);
    BOOL v14 = v13 >= v4;
    if (v13 >= v4) {
      double v15 = (char **)v10;
    }
    else {
      double v15 = (char **)(v10 + 8);
    }
    if (v14) {
      double v12 = v10;
    }
    double v10 = *v15;
  }
  while (*v15);
  if (v12 == v9 || *((_DWORD *)v12 + 8) > v4) {
    goto LABEL_37;
  }
  double v16 = (OZChannelBase *)*((void *)v12 + 5);
  double v17 = [(OZFxPlugParameterHandler *)self getScene];
  if (v17 && !*(unsigned char *)(v17[198] + 101) && !OZChannelBase::testFlag(v16, 8))
  {
    PCSharedCount::PCSharedCount(&v29);
    (*((void (**)(OZChannelBase *, PCSharedCount *))v16->var0 + 43))(v16, &v29);
    PCString::~PCString((PCString *)&v29);
  }
  [(OZFxPlugParameterHandler *)self preChannelChange:v16 flagsOnly:0];
  if (self) {
    [(OZFxPlugParameterHandler *)self motionEffectRef];
  }
  else {
    id v30 = 0;
  }
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  double v28 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel((OZLocking **)&v29, (uint64_t)&ptr);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v28);
  }
  uint64_t v19 = *(void *)v29.var0;
  if (!*(void *)v29.var0 || (unsigned __int8 v20 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v20 & 1) != 0))
  {
    [(OZFxPlugParameterHandler *)self postChannelChange:v16 flagsOnly:0];
    char v25 = 0;
    int v24 = 1;
    goto LABEL_36;
  }
  if (a3 && !*(unsigned char *)(v19 + 216))
  {
    double v21 = *(void **)(v19 + 24);
    if (!v21)
    {
      int v24 = 0;
      goto LABEL_32;
    }
    if (([v21 useLegacyCoding] & 1) == 0)
    {
      unsigned __int8 v22 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
      [v22 encodeObject:a3 forKey:@"Custom Data"];
      a3 = (id)[v22 encodedData];
    }
  }
  char v23 = [(OZFxPlugParameterHandler *)self isRendering];
  int v24 = 1;
  OZChannelBlindData::setPluginDataPtr((OZChannelBlindData *)v16, MEMORY[0x1E4F1FA48], a3, v23, 1, 1);
LABEL_32:
  [(OZFxPlugParameterHandler *)self postChannelChange:v16 flagsOnly:0];
  if (self->_startActionCalled) {
    ++self->_numWriteActions;
  }
  [(OZFxPlugParameterHandler *)self _updateUIForParm:v4];
  char v25 = 1;
LABEL_36:
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel((OZLocking **)&v29);
  ProCore_Impl::PCNSRefImpl::release(&v30);
  LOBYTE(v7) = v24 != 0;
  if ((v25 & 1) == 0) {
LABEL_37:
  }
    LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)_setCustomParameterValue:(id)a3 toParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v9 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (!v9) {
    return v9;
  }
  channelMap = self->_channelMap;
  unsigned int v13 = (char *)channelMap[1];
  double v11 = (char *)(channelMap + 1);
  double v12 = v13;
  if (!v13) {
    goto LABEL_33;
  }
  BOOL v14 = v11;
  do
  {
    unsigned int v15 = *((_DWORD *)v12 + 8);
    BOOL v16 = v15 >= v6;
    if (v15 >= v6) {
      double v17 = (char **)v12;
    }
    else {
      double v17 = (char **)(v12 + 8);
    }
    if (v16) {
      BOOL v14 = v12;
    }
    double v12 = *v17;
  }
  while (*v17);
  if (v14 == v11 || *((_DWORD *)v14 + 8) > v6) {
    goto LABEL_33;
  }
  double v18 = (OZChannelBlindData *)*((void *)v14 + 5);
  if (self) {
    [(OZFxPlugParameterHandler *)self motionEffectRef];
  }
  else {
    id v33 = 0;
  }
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v31 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v32, (uint64_t)&ptr);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v31);
  }
  uint64_t v20 = *(void *)v32[0];
  if (!*(void *)v32[0] || (unsigned __int8 v21 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v21 & 1) != 0))
  {
    char v26 = 0;
    int v25 = 1;
    goto LABEL_32;
  }
  memset(&v29, 0, sizeof(v29));
  [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
  CMTime v28 = v29;
  unsigned __int8 v22 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v28 forChannel:v18];
  [(OZFxPlugParameterHandler *)self preChannelChange:v18 flagsOnly:0];
  if (a3 && !*(unsigned char *)(v20 + 216))
  {
    char v23 = *(void **)(v20 + 24);
    if (!v23)
    {
      int v25 = 0;
      goto LABEL_28;
    }
    if (([v23 useLegacyCoding] & 1) == 0)
    {
      int v24 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
      [v24 encodeObject:a3 forKey:@"Custom Data"];
      a3 = (id)[v24 encodedData];
    }
  }
  int v25 = 1;
  OZChannelBlindData::setPluginDataPtr(v18, &v29, a3, [(OZFxPlugParameterHandler *)self isRendering], 1, 1);
LABEL_28:
  [(OZFxPlugParameterHandler *)self _updateUIForParm:v6];
  [(OZFxPlugParameterHandler *)self postChannelChange:v18 flagsOnly:0];
  if (self->_startActionCalled) {
    ++self->_numWriteActions;
  }
  [(OZFxPlugParameterHandler *)self endTimingOperation:v22];
  char v26 = 1;
LABEL_32:
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v32);
  ProCore_Impl::PCNSRefImpl::release(&v33);
  LOBYTE(v9) = v25 != 0;
  if ((v26 & 1) == 0) {
LABEL_33:
  }
    LOBYTE(v9) = 0;
  return v9;
}

- (BOOL)_setHistogramBlackIn:(double)a3 BlackOut:(double)a4 WhiteIn:(double)a5 WhiteOut:(double)a6 Gamma:(double)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(id)a10
{
  uint64_t v11 = *(void *)&a9;
  BOOL v19 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v19)
  {
    channelMap = self->_channelMap;
    char v23 = (char *)channelMap[1];
    unsigned __int8 v21 = (char *)(channelMap + 1);
    unsigned __int8 v22 = v23;
    if (!v23) {
      goto LABEL_13;
    }
    int v24 = v21;
    do
    {
      unsigned int v25 = *((_DWORD *)v22 + 8);
      BOOL v26 = v25 >= v11;
      if (v25 >= v11) {
        double v27 = (char **)v22;
      }
      else {
        double v27 = (char **)(v22 + 8);
      }
      if (v26) {
        int v24 = v22;
      }
      unsigned __int8 v22 = *v27;
    }
    while (*v27);
    if (v24 != v21 && *((_DWORD *)v24 + 8) <= v11)
    {
      CMTime v28 = (OZChannelBase *)*((void *)v24 + 5);
      CMTime v29 = [(OZFxPlugParameterHandler *)self getScene];
      if (v29 && !*(unsigned char *)(v29[198] + 101) && !OZChannelBase::testFlag(v28, 8))
      {
        PCSharedCount::PCSharedCount(v36);
        (*((void (**)(OZChannelBase *, PCSharedCount *))v28->var0 + 43))(v28, v36);
        PCString::~PCString((PCString *)v36);
      }
      [(OZFxPlugParameterHandler *)self preChannelChange:v28 flagsOnly:0];
      if (self)
      {
        [(OZFxPlugParameterHandler *)self motionEffectRef];
        v36[0].var0 = 0;
        v36[1].var0 = 0;
        uint64_t v37 = 0;
        [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a10.var1 withConversionData:0];
      }
      else
      {
        uint64_t v37 = 0;
        id v38 = 0;
        v36[0].var0 = 0;
        v36[1].var0 = 0;
      }
      long long v34 = *(_OWORD *)&v36[0].var0;
      uint64_t v35 = v37;
      id v30 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v34 forChannel:v28];
      switch(a8)
      {
        case 1uLL:
          p_var7 = &v28[11].var7;
          break;
        case 2uLL:
          p_var7 = &v28[19].var7;
          break;
        case 3uLL:
          p_var7 = &v28[27].var7;
          break;
        case 4uLL:
          p_var7 = &v28[35].var7;
          break;
        default:
          p_var7 = &v28[3].var7;
          break;
      }
      BOOL v32 = [(OZFxPlugParameterHandler *)self isRendering];
      (*(void (**)(unint64_t *, PCSharedCount *, BOOL, double))(p_var7[17] + 712))(p_var7 + 17, v36, v32, a3);
      (*(void (**)(unint64_t *, PCSharedCount *, BOOL, double))(p_var7[36] + 712))(p_var7 + 36, v36, v32, a4);
      (*(void (**)(unint64_t *, PCSharedCount *, BOOL, double))(p_var7[55] + 712))(p_var7 + 55, v36, v32, a5);
      (*(void (**)(unint64_t *, PCSharedCount *, BOOL, double))(p_var7[74] + 712))(p_var7 + 74, v36, v32, a6);
      (*(void (**)(unint64_t *, PCSharedCount *, BOOL, double))(p_var7[93] + 712))(p_var7 + 93, v36, v32, a7);
      [(OZFxPlugParameterHandler *)self endTimingOperation:v30];
      [(OZFxPlugParameterHandler *)self postChannelChange:v28 flagsOnly:0];
      if (self->_startActionCalled) {
        ++self->_numWriteActions;
      }
      [(OZFxPlugParameterHandler *)self _updateUIForParm:v11];
      ProCore_Impl::PCNSRefImpl::release(&v38);
      LOBYTE(v19) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v19) = 0;
    }
  }
  return v19;
}

- (BOOL)setHistogramBlackIn:(double)a3 BlackOut:(double)a4 WhiteIn:(double)a5 WhiteOut:(double)a6 Gamma:(double)a7 forChannel:(unint64_t)a8 fromParm:(unsigned int)a9 atTime:(double)a10
{
  return [(OZFxPlugParameterHandler *)self _setHistogramBlackIn:a8 BlackOut:*(void *)&a9 WhiteIn:*(void *)&a10 WhiteOut:a3 Gamma:a4 forChannel:a5 fromParm:a6 atTime:a7];
}

- (BOOL)setLevelsBlack:(double)a3 White:(double)a4 Gamma:(double)a5 forParm:(unsigned int)a6 atTime:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v13 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v13)
  {
    channelMap = self->_channelMap;
    double v17 = (char *)channelMap[1];
    unsigned int v15 = (char *)(channelMap + 1);
    BOOL v16 = v17;
    if (!v17) {
      goto LABEL_13;
    }
    double v18 = v15;
    do
    {
      unsigned int v19 = *((_DWORD *)v16 + 8);
      BOOL v20 = v19 >= v8;
      if (v19 >= v8) {
        unsigned __int8 v21 = (char **)v16;
      }
      else {
        unsigned __int8 v21 = (char **)(v16 + 8);
      }
      if (v20) {
        double v18 = v16;
      }
      BOOL v16 = *v21;
    }
    while (*v21);
    if (v18 != v15 && *((_DWORD *)v18 + 8) <= v8)
    {
      unsigned __int8 v22 = (OZChannelBase *)*((void *)v18 + 5);
      char v23 = [(OZFxPlugParameterHandler *)self getScene];
      if (v23 && !*(unsigned char *)(v23[198] + 101) && !OZChannelBase::testFlag(v22, 8))
      {
        PCSharedCount::PCSharedCount((PCSharedCount *)&v27);
        (*((void (**)(OZChannelBase *, CMTime *))v22->var0 + 43))(v22, &v27);
        PCString::~PCString((PCString *)&v27);
      }
      if (self)
      {
        [(OZFxPlugParameterHandler *)self motionEffectRef];
        memset(&v27, 0, sizeof(v27));
        [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a7.var1 withConversionData:0];
      }
      else
      {
        id v28 = 0;
        memset(&v27, 0, sizeof(v27));
      }
      CMTime v26 = v27;
      int v24 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v26 forChannel:v22];
      [(OZFxPlugParameterHandler *)self preChannelChange:v22 flagsOnly:0];
      OZChannelLevels::setBlackValue((OZChannelLevels *)v22, &v27, a3, 0);
      OZChannelLevels::setWhiteValue((OZChannelLevels *)v22, &v27, a4, 0);
      OZChannelLevels::setGammaValue((OZChannelLevels *)v22, &v27, a5, 0);
      [(OZFxPlugParameterHandler *)self postChannelChange:v22 flagsOnly:0];
      [(OZFxPlugParameterHandler *)self endTimingOperation:v24];
      if (self->_startActionCalled) {
        ++self->_numWriteActions;
      }
      [(OZFxPlugParameterHandler *)self _updateUIForParm:v8];
      ProCore_Impl::PCNSRefImpl::release(&v28);
      LOBYTE(v13) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (BOOL)addFlags:(unsigned int)a3 toParm:(unsigned int)a4
{
  return 1;
}

- (BOOL)removeFlags:(unsigned int)a3 fromParm:(unsigned int)a4
{
  return 1;
}

- (BOOL)setParameterFlags:(unsigned int)a3 toParm:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v7 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v7)
  {
    channelMap = self->_channelMap;
    uint64_t v11 = (char *)channelMap[1];
    BOOL v9 = (char *)(channelMap + 1);
    double v10 = v11;
    if (!v11) {
      goto LABEL_13;
    }
    double v12 = v9;
    do
    {
      unsigned int v13 = *((_DWORD *)v10 + 8);
      BOOL v14 = v13 >= v4;
      if (v13 >= v4) {
        unsigned int v15 = (char **)v10;
      }
      else {
        unsigned int v15 = (char **)(v10 + 8);
      }
      if (v14) {
        double v12 = v10;
      }
      double v10 = *v15;
    }
    while (*v15);
    if (v12 != v9 && *((_DWORD *)v12 + 8) <= v4)
    {
      BOOL v16 = (OZChannelBase *)*((void *)v12 + 5);
      if (v16) {
      else
      }
        double v17 = 0;
      [(OZFxPlugParameterHandler *)self preChannelChange:v16 flagsOnly:1];
      if (self) {
        [(OZFxPlugParameterHandler *)self motionEffectRef];
      }
      else {
        id v27 = 0;
      }
      if (!(a3 & 1) != (*((unsigned int (**)(OZChannelBase *))v16->var0 + 64))(v16)) {
        (*((void (**)(OZChannelBase *, BOOL, void))v16->var0 + 63))(v16, (a3 & 1) == 0, 0);
      }
      unint64_t var7 = v16->var7;
      uint64_t v19 = 4259872;
      if ((a3 & 2) == 0) {
        uint64_t v19 = 0;
      }
      uint64_t v20 = v19 | a3 & 4 | (a3 >> 1) & 8;
      if ((a3 & 0x20) != 0) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = v20 | 0x10;
      }
      unsigned int v22 = var7 ^ v21;
      if (((var7 ^ v21) & 0x410030) != 0) {
        int v23 = 12;
      }
      else {
        int v23 = 0;
      }
      if (v21 != (var7 & 0x41003C))
      {
        OZChannelBase::setFlag(v16, v21 | 0x100000000, 1);
        OZChannelBase::resetFlag(v16, ~v21 & 0x41003C, 1);
      }
      if ((a3 & 8) != 0 && v17 && !OZChannelFolder::testFoldFlag(v17, 4)) {
        OZChannelFolder::setFoldFlag(v17, 4);
      }
      [(OZFxPlugParameterHandler *)self postChannelChange:v16 flagsOnly:1];
      uint64_t v24 = v23 & 0xFFFF7FFF | (((v22 >> 2) & 1) << 15);
      if (self->_startActionCalled) {
        ++self->_numWriteActions;
      }
      unsigned int v25 = +[OZFxPlugParameterHandlerUIUpdate updateWithParamID:v4 notificationFlags:v24];
      if ([(OZFxPlugParameterHandler *)self isRendering]) {
        [(OZFxPlugParameterHandler *)self performSelectorOnMainThread:sel__updateUI_ withObject:v25 waitUntilDone:0];
      }
      ProCore_Impl::PCNSRefImpl::release(&v27);
      LOBYTE(v7) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (BOOL)setStringParameterValue:(id)a3 toParm:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v7 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v7)
  {
    channelMap = self->_channelMap;
    uint64_t v11 = (char *)channelMap[1];
    BOOL v9 = (char *)(channelMap + 1);
    double v10 = v11;
    if (!v11) {
      goto LABEL_13;
    }
    double v12 = v9;
    do
    {
      unsigned int v13 = *((_DWORD *)v10 + 8);
      BOOL v14 = v13 >= v4;
      if (v13 >= v4) {
        unsigned int v15 = (char **)v10;
      }
      else {
        unsigned int v15 = (char **)(v10 + 8);
      }
      if (v14) {
        double v12 = v10;
      }
      double v10 = *v15;
    }
    while (*v15);
    if (v12 != v9 && *((_DWORD *)v12 + 8) <= v4)
    {
      BOOL v16 = (OZChannelBase *)*((void *)v12 + 5);
      double v17 = [(OZFxPlugParameterHandler *)self getScene];
      if (v17 && !*(unsigned char *)(v17[198] + 101) && !OZChannelBase::testFlag(v16, 8))
      {
        PCSharedCount::PCSharedCount(&v20);
        (*((void (**)(OZChannelBase *, PCSharedCount *))v16->var0 + 43))(v16, &v20);
        PCString::~PCString((PCString *)&v20);
      }
      [(OZFxPlugParameterHandler *)self preChannelChange:v16 flagsOnly:0];
      if (self) {
        [(OZFxPlugParameterHandler *)self motionEffectRef];
      }
      else {
        v20.var0 = 0;
      }
      PCURL::PCURL((PCURL *)&v19, a3);
      (*((void (**)(OZChannelBase *, PCString *, BOOL, void))v16->var0 + 108))(v16, &v19, [(OZFxPlugParameterHandler *)self isRendering], 0);
      PCString::~PCString(&v19);
      [(OZFxPlugParameterHandler *)self postChannelChange:v16 flagsOnly:0];
      if (self->_startActionCalled) {
        ++self->_numWriteActions;
      }
      [(OZFxPlugParameterHandler *)self _updateUIForParm:v4];
      ProCore_Impl::PCNSRefImpl::release((id *)&v20.var0);
      LOBYTE(v7) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (BOOL)setGradientStartEnd:(double)a3 startY:(double)a4 endX:(double)a5 endY:(double)a6 toParm:(unsigned int)a7 atTime:(id)a8
{
  channelMap = self->_channelMap;
  uint64_t v11 = (char *)channelMap[1];
  BOOL v9 = (char *)(channelMap + 1);
  double v10 = v11;
  if (!v11) {
    return 0;
  }
  uint64_t v13 = *(void *)&a7;
  PCString v19 = v9;
  do
  {
    unsigned int v20 = *((_DWORD *)v10 + 8);
    BOOL v21 = v20 >= a7;
    if (v20 >= a7) {
      unsigned int v22 = (char **)v10;
    }
    else {
      unsigned int v22 = (char **)(v10 + 8);
    }
    if (v21) {
      PCString v19 = v10;
    }
    double v10 = *v22;
  }
  while (*v22);
  if (v19 == v9 || *((_DWORD *)v19 + 8) > a7) {
    return 0;
  }
  uint64_t v24 = *((void *)v19 + 5);
  if (self)
  {
    [(OZFxPlugParameterHandler *)self motionEffectRef];
    memset(&v28, 0, sizeof(v28));
    [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a8.var1 withConversionData:0];
  }
  else
  {
    id v29 = 0;
    memset(&v28, 0, sizeof(v28));
  }
  CMTime v27 = v28;
  unsigned int v25 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v27 forChannel:v24];
  [(OZFxPlugParameterHandler *)self preChannelChange:v24 + 1056 flagsOnly:0];
  [(OZFxPlugParameterHandler *)self isRendering];
  OZChannelPosition::setPosition((OZChannelPosition *)(v24 + 1056), &v28, a3, a4);
  [(OZFxPlugParameterHandler *)self postChannelChange:v24 + 1056 flagsOnly:0];
  CMTime v26 = (OZChannelPosition *)(v24 + 1760);
  [(OZFxPlugParameterHandler *)self preChannelChange:v26 flagsOnly:0];
  [(OZFxPlugParameterHandler *)self isRendering];
  OZChannelPosition::setPosition(v26, &v28, a5, a6);
  [(OZFxPlugParameterHandler *)self postChannelChange:v26 flagsOnly:0];
  [(OZFxPlugParameterHandler *)self endTimingOperation:v25];
  [(OZFxPlugParameterHandler *)self _updateUIForParm:v13];
  ProCore_Impl::PCNSRefImpl::release(&v29);
  return 1;
}

- (BOOL)setGradientFlags:(BOOL)a3 toParam:(unsigned int)a4
{
  channelMap = self->_channelMap;
  BOOL v7 = (char *)channelMap[1];
  uint64_t v5 = (char *)(channelMap + 1);
  uint64_t v6 = v7;
  if (!v7) {
    return 0;
  }
  uint64_t v8 = *(void *)&a4;
  BOOL v9 = a3;
  uint64_t v11 = v5;
  do
  {
    unsigned int v12 = *((_DWORD *)v6 + 8);
    BOOL v13 = v12 >= a4;
    if (v12 >= a4) {
      BOOL v14 = (char **)v6;
    }
    else {
      BOOL v14 = (char **)(v6 + 8);
    }
    if (v13) {
      uint64_t v11 = v6;
    }
    uint64_t v6 = *v14;
  }
  while (*v14);
  if (v11 == v5 || *((_DWORD *)v11 + 8) > a4) {
    return 0;
  }
  uint64_t v16 = *((void *)v11 + 5);
  if (self) {
    [(OZFxPlugParameterHandler *)self motionEffectRef];
  }
  else {
    id v17 = 0;
  }
  [(OZFxPlugParameterHandler *)self preChannelChange:v16 + 1056 flagsOnly:1];
  if (v9) {
    OZChannelBase::resetFlag((OZChannelBase *)(v16 + 1056), 0x8000, 0);
  }
  else {
    OZChannelBase::setFlag((OZChannelBase *)(v16 + 1056), 0x8000, 0);
  }
  [(OZFxPlugParameterHandler *)self postChannelChange:v16 + 1056 flagsOnly:1];
  [(OZFxPlugParameterHandler *)self preChannelChange:v16 + 1760 flagsOnly:1];
  if (v9) {
    OZChannelBase::resetFlag((OZChannelBase *)(v16 + 1760), 0x8000, 0);
  }
  else {
    OZChannelBase::setFlag((OZChannelBase *)(v16 + 1760), 0x8000, 0);
  }
  [(OZFxPlugParameterHandler *)self postChannelChange:v16 + 1760 flagsOnly:1];
  [(OZFxPlugParameterHandler *)self preChannelChange:v16 + 800 flagsOnly:1];
  if (v9) {
    OZChannelBase::resetFlag((OZChannelBase *)(v16 + 800), 0x8000, 0);
  }
  else {
    OZChannelBase::setFlag((OZChannelBase *)(v16 + 800), 0x8000, 0);
  }
  [(OZFxPlugParameterHandler *)self postChannelChange:v16 + 800 flagsOnly:1];
  [(OZFxPlugParameterHandler *)self _updateUIForParm:v8];
  ProCore_Impl::PCNSRefImpl::release(&v17);
  return 1;
}

- (BOOL)setGradientHiddenWithOSC:(BOOL)a3 toParam:(unsigned int)a4
{
  channelMap = self->_channelMap;
  BOOL v7 = (char *)channelMap[1];
  uint64_t v5 = (char *)(channelMap + 1);
  uint64_t v6 = v7;
  if (!v7) {
    return 0;
  }
  uint64_t v8 = *(void *)&a4;
  BOOL v9 = a3;
  uint64_t v11 = v5;
  do
  {
    unsigned int v12 = *((_DWORD *)v6 + 8);
    BOOL v13 = v12 >= a4;
    if (v12 >= a4) {
      BOOL v14 = (char **)v6;
    }
    else {
      BOOL v14 = (char **)(v6 + 8);
    }
    if (v13) {
      uint64_t v11 = v6;
    }
    uint64_t v6 = *v14;
  }
  while (*v14);
  if (v11 == v5 || *((_DWORD *)v11 + 8) > a4) {
    return 0;
  }
  uint64_t v16 = [(OZFxPlugParameterHandler *)self getScene];
  if (v16)
  {
    id v17 = (OZDocument *)v16[198];
    if (v17) {
      OZDocument::postNotification(v17, 32);
    }
  }
  double v18 = (OZChannelBase *)*((void *)v11 + 5);
  if (self) {
    [(OZFxPlugParameterHandler *)self motionEffectRef];
  }
  else {
    id v19 = 0;
  }
  [(OZFxPlugParameterHandler *)self preChannelChange:OZChannelBase::getChannelRootBase(v18) flagsOnly:1];
  if (v9) {
    OZChannelBase::setFlag(v18, 2, 0);
  }
  else {
    OZChannelBase::resetFlag(v18, 2, 0);
  }
  [(OZFxPlugParameterHandler *)self postChannelChange:OZChannelBase::getChannelRootBase(v18) flagsOnly:1];
  [(OZFxPlugParameterHandler *)self _updateUIForParm:v8];
  ProCore_Impl::PCNSRefImpl::release(&v19);
  return 1;
}

- (BOOL)_setPathID:(void *)a3 toParm:(unsigned int)a4 atTime:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v9 = [(OZFxPlugParameterHandler *)self safeToSetParameters];
  if (v9)
  {
    channelMap = self->_channelMap;
    BOOL v13 = (char *)channelMap[1];
    uint64_t v11 = (char *)(channelMap + 1);
    unsigned int v12 = v13;
    if (!v13) {
      goto LABEL_13;
    }
    BOOL v14 = v11;
    do
    {
      unsigned int v15 = *((_DWORD *)v12 + 8);
      BOOL v16 = v15 >= v6;
      if (v15 >= v6) {
        id v17 = (char **)v12;
      }
      else {
        id v17 = (char **)(v12 + 8);
      }
      if (v16) {
        BOOL v14 = v12;
      }
      unsigned int v12 = *v17;
    }
    while (*v17);
    if (v14 != v11 && *((_DWORD *)v14 + 8) <= v6)
    {
      double v18 = (OZChanSceneNodeRef *)*((void *)v14 + 5);
      if (self)
      {
        [(OZFxPlugParameterHandler *)self motionEffectRef];
        long long v23 = 0uLL;
        uint64_t v24 = 0;
        [(OZFxPlugParameterHandler *)self fxTimeToFigTime:a5.var1 withConversionData:0];
      }
      else
      {
        uint64_t v24 = 0;
        id v25 = 0;
        long long v23 = 0uLL;
      }
      long long v21 = v23;
      uint64_t v22 = v24;
      id v19 = [(OZFxPlugParameterHandler *)self beginTimingOperation:&v21 forChannel:v18];
      [(OZFxPlugParameterHandler *)self preChannelChange:v18 flagsOnly:0];
      OZChanSceneNodeRef::setNode(v18, (OZSceneNode *)a3);
      [(OZFxPlugParameterHandler *)self postChannelChange:v18 flagsOnly:0];
      [(OZFxPlugParameterHandler *)self endTimingOperation:v19];
      [(OZFxPlugParameterHandler *)self _updateUIForParm:v6];
      ProCore_Impl::PCNSRefImpl::release(&v25);
      LOBYTE(v9) = 1;
    }
    else
    {
LABEL_13:
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)setFloatValue:(double)a3 toParm:(unsigned int)a4 atTime:(double)a5
{
  return [(OZFxPlugParameterHandler *)self _setFloatValue:*(void *)&a4 toParm:*(void *)&a5 atTime:a3];
}

- (BOOL)setIntValue:(int)a3 toParm:(unsigned int)a4 atTime:(double)a5
{
  return [(OZFxPlugParameterHandler *)self _setIntValue:*(void *)&a3 toParm:*(void *)&a4 atTime:*(void *)&a5];
}

- (BOOL)setBoolValue:(BOOL)a3 toParm:(unsigned int)a4 atTime:(double)a5
{
  return [(OZFxPlugParameterHandler *)self _setBoolValue:a3 toParm:*(void *)&a4 atTime:*(void *)&a5];
}

- (BOOL)setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 toParm:(unsigned int)a6 atTime:(double)a7
{
  return [(OZFxPlugParameterHandler *)self _setRedValue:*(void *)&a6 greenValue:*(void *)&a7 blueValue:a3 toParm:a4 atTime:a5];
}

- (BOOL)setRedValue:(double)a3 greenValue:(double)a4 blueValue:(double)a5 alphaValue:(double)a6 toParm:(unsigned int)a7 atTime:(double)a8
{
  return [(OZFxPlugParameterHandler *)self _setRedValue:*(void *)&a7 greenValue:*(void *)&a8 blueValue:a3 alphaValue:a4 toParm:a5 atTime:a6];
}

- (BOOL)setXValue:(double)a3 YValue:(double)a4 toParm:(unsigned int)a5 atTime:(double)a6
{
  return [(OZFxPlugParameterHandler *)self _setXValue:*(void *)&a5 YValue:*(void *)&a6 toParm:a3 atTime:a4];
}

- (BOOL)setCustomParameterValue:(id)a3 toParm:(unsigned int)a4 atTime:(double)a5
{
  return [(OZFxPlugParameterHandler *)self _setCustomParameterValue:a3 toParm:*(void *)&a4 atTime:*(void *)&a5];
}

- (BOOL)setPathID:(void *)a3 toParm:(unsigned int)a4 atTime:(double)a5
{
  return [(OZFxPlugParameterHandler *)self _setPathID:a3 toParm:*(void *)&a4 atTime:*(void *)&a5];
}

- (BOOL)startUndoGroup:(id)a3
{
  uint64_t v4 = [(OZFxPlugParameterHandler *)self getScene];
  if (v4)
  {
    uint64_t v5 = v4[198];
    if (v5)
    {
      v7.var0 = 0;
      PCString::set(&v7, (CFStringRef)a3);
      OZDocument::startCaptureModifiedChannels(v5, &v7);
      PCString::~PCString(&v7);
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (BOOL)endUndoGroup
{
  var2 = [(OZFxPlugParameterHandler *)self getScene];
  if (var2)
  {
    var2 = (OZChannelBase *)var2[14].var2;
    if (var2)
    {
      OZDocument::endCaptureModifiedChannels(var2, v3);
      LOBYTE(var2) = 1;
    }
  }
  return (char)var2;
}

- (void)_updateUIForParm:(int)a3
{
  uint64_t v4 = +[OZFxPlugParameterHandlerUIUpdate updateWithParamID:*(void *)&a3 notificationFlags:8];
  if ([(OZFxPlugParameterHandler *)self isRendering])
  {
    [(OZFxPlugParameterHandler *)self performSelectorOnMainThread:sel__updateUI_ withObject:v4 waitUntilDone:0];
  }
  else
  {
    [(OZFxPlugParameterHandler *)self _updateUI:v4];
  }
}

- (void)_updateUI:(id)a3
{
  uint64_t v5 = [a3 paramID];
  uint64_t v6 = v5;
  channelMap = self->_channelMap;
  double v10 = (char *)channelMap[1];
  uint64_t v8 = (char *)(channelMap + 1);
  BOOL v9 = v10;
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = v8;
  do
  {
    unsigned int v12 = *((_DWORD *)v9 + 8);
    BOOL v13 = v12 >= v5;
    if (v12 >= v5) {
      BOOL v14 = (char **)v9;
    }
    else {
      BOOL v14 = (char **)(v9 + 8);
    }
    if (v13) {
      uint64_t v11 = v9;
    }
    BOOL v9 = *v14;
  }
  while (*v14);
  if (v11 != v8 && v5 >= *((_DWORD *)v11 + 8))
  {
    unsigned int v15 = [(OZFxPlugParameterHandler *)self getScene];
    if (v15)
    {
      BOOL v16 = (OZDocument *)v15[198];
      if (v16)
      {
        int v17 = [a3 notificationFlags];
        OZDocument::postNotification(v16, v17);
      }
      else
      {
        NSLog(&cfstr_UnableToFindDo.isa, v6);
      }
    }
    else
    {
      NSLog(&cfstr_UnableToFindSc_0.isa, v6);
    }
  }
  else
  {
LABEL_12:
    NSLog(&cfstr_UnableToFindPa.isa, v5);
  }
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1F121A238 == a3
      || &unk_1F121A2D8 == a3
      || &unk_1F121A3D0 == a3
      || &unk_1F121A608 == a3
      || &unk_1F121A690 == a3
      || &unk_1F121A8D0 == a3
      || &unk_1F121A950 == a3
      || &unk_1F121AAA8 == a3
      || &unk_1F121AB90 == a3
      || &unk_1F121AC40 == a3
      || &unk_1F121AF78 == a3
      || &unk_1F121B330 == a3
      || &unk_1F121B008 == a3
      || &unk_1F121B0C8 == a3;
}

- (void)setRenderParams:(const void *)a3 withLithiumInput:(void *)a4 withLithiumAgent:(void *)a5
{
  p_threadContextManager = &self->_threadContextManager;
  v8.var0 = *(PC_Sp_counted_base **)a4;
  PCSharedCount::PCSharedCount(&v9, (const PCSharedCount *)a4 + 1);
  OZFxPlugRenderContextManager::setThreadInfo((uint64_t)p_threadContextManager, &v8, (LiRenderParameters **)a5, (uint64_t)a3);
  PCSharedCount::~PCSharedCount(&v9);
}

- (void)getFieldMode:(int *)a3 fromFootage:(void *)a4
{
  if (a4)
  {
    CMTime v4 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    *a3 = OZFootage::getFieldDominance((OZFootage *)a4, &v4);
  }
}

- (void)actionStarted
{
  self->_startActionCalled = 1;
  self->_numWriteActions = 0;
}

- (void)actionEnded
{
  self->_startActionCalled = 0;
  self->_numWriteActions = 0;
}

- (int)numWriteActions
{
  return self->_numWriteActions;
}

- (BOOL)hasValidParameterID:(int)a3 checkMix:(BOOL)a4 checkSpecialCheckboxIDs:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  unsigned int v15 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v16, (uint64_t)&ptr);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v15);
  }
  if (!*(void *)v16[0]) {
    goto LABEL_15;
  }
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
  if (v10) {
    goto LABEL_15;
  }
  BOOL v11 = !a4;
  BOOL v12 = 1;
  if (v7 != 10001) {
    BOOL v11 = 0;
  }
  if (!v11
    && (v7 - 9999) <= 0xFFFFD8F1
    && *(unsigned char *)(*(void *)v16[0] + 216)
    && ((v7 - 10006) < 0xFFFFFFFC || v5))
  {
    NSLog(&cfstr_FxplugErrorPar.isa, v7);
LABEL_15:
    BOOL v12 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v16);
  return v12;
}

- (BOOL)parameter:(int)a3 hasValidFlags:(unsigned int)a4
{
  unsigned int v4 = a4 & 0xFFFDF480;
  if ((a4 & 0xFFFDF480) != 0) {
    NSLog(&cfstr_FxplugErrorPar_0.isa, a2, a3, *(void *)&a4);
  }
  return v4 == 0;
}

- (BOOL)_floatParameter:(int)a3 hasValidMin:(double)a4 max:(double)a5 sliderMin:(double)a6 sliderMax:(double)a7 defaultValue:(double)a8 paramFlags:(unsigned int)a9
{
  uint64_t v9 = *(void *)&a9;
  uint64_t v15 = *(void *)&a3;
  BOOL v17 = [(OZFxPlugParameterHandler *)self hasValidParameterID:*(void *)&a3 checkMix:0 checkSpecialCheckboxIDs:1];
  LOBYTE(v18) = 0;
  if (v17)
  {
    BOOL v18 = [(OZFxPlugParameterHandler *)self parameter:v15 hasValidFlags:v9];
    if ((v9 & 0x100) != 0 || !v18)
    {
      if (!v18) {
        return v18;
      }
    }
    else
    {
      if (a4 > a5)
      {
        NSLog(&cfstr_FxplugErrorPar_1.isa, v15, *(void *)&a4, *(void *)&a5);
LABEL_34:
        LOBYTE(v18) = 0;
        return v18;
      }
      if (a4 > a8 || a8 > a5)
      {
        NSLog(&cfstr_FxplugErrorPar_2.isa, v15, *(void *)&a8, *(void *)&a4, *(void *)&a5);
        goto LABEL_34;
      }
      if (a6 < a4)
      {
        NSLog(&cfstr_FxplugErrorPar_3.isa, v15, *(void *)&a6, *(void *)&a4);
        goto LABEL_34;
      }
      if (a6 > a5)
      {
        NSLog(&cfstr_FxplugErrorPar_4.isa, v15, *(void *)&a6, *(void *)&a5);
        goto LABEL_34;
      }
      if (a7 > a5)
      {
        NSLog(&cfstr_FxplugErrorPar_5.isa, v15, *(void *)&a7, *(void *)&a5);
        goto LABEL_34;
      }
      if (a7 < a4)
      {
        NSLog(&cfstr_FxplugErrorPar_6.isa, v15, *(void *)&a7, *(void *)&a4);
        goto LABEL_34;
      }
    }
    if (fabs(a4) == INFINITY)
    {
      NSLog(&cfstr_FxplugErrorPar_7.isa, v15, *(void *)&a4);
      goto LABEL_34;
    }
    if (fabs(a5) == INFINITY)
    {
      NSLog(&cfstr_FxplugErrorPar_8.isa, v15, *(void *)&a5);
      goto LABEL_34;
    }
    if (fabs(a8) == INFINITY)
    {
      NSLog(&cfstr_FxplugErrorPar_9.isa, v15, *(void *)&a8);
      goto LABEL_34;
    }
    if (fabs(a6) == INFINITY)
    {
      NSLog(&cfstr_FxplugErrorPar_10.isa, v15, *(void *)&a6);
      goto LABEL_34;
    }
    if (fabs(a7) == INFINITY)
    {
      NSLog(&cfstr_FxplugErrorPar_11.isa, v15, *(void *)&a7);
      goto LABEL_34;
    }
    if (a6 > a7)
    {
      NSLog(&cfstr_FxplugErrorPar_12.isa, v15, *(void *)&a6, *(void *)&a7);
      goto LABEL_34;
    }
    if (a6 > a8 || a8 > a7)
    {
      NSLog(&cfstr_FxplugErrorPar_13.isa, v15, *(void *)&a8, *(void *)&a6, *(void *)&a7);
      goto LABEL_34;
    }
    LOBYTE(v18) = 1;
  }
  return v18;
}

- (BOOL)_intParameter:(int)a3 hasValidMin:(int)a4 max:(int)a5 sliderMin:(int)a6 sliderMax:(int)a7 defaultValue:(int)a8 paramFlags:(unsigned int)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = *(void *)&a3;
  BOOL v16 = [(OZFxPlugParameterHandler *)self hasValidParameterID:*(void *)&a3 checkMix:1 checkSpecialCheckboxIDs:1];
  if (v16) {
    BOOL v16 = [(OZFxPlugParameterHandler *)self parameter:v14 hasValidFlags:a9];
  }
  if ((a9 & 0x100) != 0)
  {
LABEL_19:
    if ((int)v11 > (int)v10 && v16)
    {
      NSLog(&cfstr_FxplugErrorPar_20.isa, v14, v11, v10);
      goto LABEL_27;
    }
    if (v16)
    {
      if ((int)v11 > (int)v9 || (int)v9 > (int)v10)
      {
        NSLog(&cfstr_FxplugErrorPar_21.isa, v14, v9, v11, v10);
        goto LABEL_27;
      }
      LOBYTE(v16) = 1;
    }
    return v16;
  }
  if ((int)v13 > (int)v12)
  {
    NSLog(&cfstr_FxplugErrorPar_14.isa, v14, v13, v12);
LABEL_27:
    LOBYTE(v16) = 0;
    return v16;
  }
  if (v16)
  {
    if ((int)v13 > (int)v9 || (int)v9 > (int)v12)
    {
      NSLog(&cfstr_FxplugErrorPar_15.isa, v14, v9, v13, v12);
      goto LABEL_27;
    }
    if ((int)v11 < (int)v13)
    {
      NSLog(&cfstr_FxplugErrorPar_16.isa, v14, v11, v13);
      goto LABEL_27;
    }
    if ((int)v11 > (int)v12)
    {
      NSLog(&cfstr_FxplugErrorPar_17.isa, v14, v11, v12);
      goto LABEL_27;
    }
    if ((int)v10 > (int)v12)
    {
      NSLog(&cfstr_FxplugErrorPar_18.isa, v14, v10, v12);
      goto LABEL_27;
    }
    if ((int)v10 < (int)v13)
    {
      NSLog(&cfstr_FxplugErrorPar_19.isa, v14, v10, v13);
      goto LABEL_27;
    }
    BOOL v16 = 1;
    goto LABEL_19;
  }
  return v16;
}

- (void)setIsRendering:(BOOL)a3
{
}

- (BOOL)isRendering
{
  return OZFxPlugRenderContextManager::isRendering(&self->_threadContextManager);
}

- (void)customParameterList
{
  return &self->_customParameterList;
}

- (void)setIsNewGradientColorize:(BOOL)a3
{
  self->_isNewGradientColorize = a3;
}

- (void)baseChannel
{
  return self->_baseChannel;
}

- (OZRenderState)getTempContextRenderState
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  uint64_t v10 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v11, (uint64_t)&ptr);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  if (!*(void *)v11[0] || (unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v6 & 1) != 0))
  {
    OZRenderState::OZRenderState(retstr);
  }
  else
  {
    RenderParams = (const OZRenderState *)OZFxPlugRenderContextManager::getRenderParams(&self->_threadContextManager, *(OZFxPlugSharedBase **)v11[0]);
    OZRenderState::OZRenderState(retstr, RenderParams);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v11);
  return result;
}

- (void)getPointChannel:(OZChannel *)a3 nearestPoint:(PCVector2<double>)a4 atTime:(id *)a5
{
  v9.var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)-[OZFxPlugParameterHandler figTimeToFxTime:withConversionData:](self, "figTimeToFxTime:withConversionData:", v5, 0, a4.var0, a4.var1);
  channelMap = self->_channelMap;
  uint64_t v11 = (void *)*channelMap;
  if ((void *)*channelMap == channelMap + 1)
  {
    uint64_t v13 = 0;
  }
  else
  {
    var1 = v9.var1;
    uint64_t v13 = 0;
    double v14 = 3.40282347e38;
    do
    {
      uint64_t v15 = (const void *)v11[5];
      if (v15)
      {
        if (v16)
        {
          BOOL v17 = v16;
          double v22 = 0.0;
          double v23 = 0.0;
          [(OZFxPlugParameterHandler *)self _getXValue:&v23 YValue:&v22 fromParm:*((unsigned int *)v11 + 8) atTime:var1];
          double v18 = sqrt((v23 - *(double *)&a5->var0) * (v23 - *(double *)&a5->var0)+ (v22 - *(double *)&a5->var1) * (v22 - *(double *)&a5->var1));
          if (v18 < v14)
          {
            uint64_t v13 = v17;
            double v14 = v18;
          }
        }
      }
      id v19 = (void *)v11[1];
      if (v19)
      {
        do
        {
          unsigned int v20 = v19;
          id v19 = (void *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          unsigned int v20 = (void *)v11[2];
          BOOL v21 = *v20 == (void)v11;
          uint64_t v11 = v20;
        }
        while (!v21);
      }
      uint64_t v11 = v20;
    }
    while (v20 != (void *)self->_channelMap + 1);
  }
  *a3 = v13;
}

- (BOOL)hasPointParameters
{
  return self->_hasPointParam;
}

- (PCRect<double>)getBoundsFromSceneNode:(void *)a3 withRenderParams:(void *)a4
{
  uint64_t v8 = v4;
  *(void *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v4 + 16) = _Q0;
  if (!a3)
  {
    uint64_t v15 = 0;
LABEL_6:
    (*(void (**)(void *, uint64_t, void *))(*(void *)v15 + 16))(v15, v8, a4);
    if (!self) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  if (!v14) {
    goto LABEL_6;
  }
  (*(void (**)(void *, uint64_t, void *))(*(void *)v14 + 1552))(v14, v8, a4);
  if (!self)
  {
LABEL_4:
    id v20 = 0;
    goto LABEL_9;
  }
LABEL_7:
  [(OZFxPlugParameterHandler *)self motionEffectRef];
  if (v20) {
    [(OZFxPlugParameterHandler *)self isImageWellMediaFlexoMediaForSceneNode:a3];
  }
LABEL_9:
  ProCore_Impl::PCNSRefImpl::release(&v20);
  result.unsigned int var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (PCPtr<LiImageSource>)makeSourceFromSceneNode:(void *)a3 withRenderParams:(void *)a4
{
  uint64_t v7 = v4;
  v4->var0 = 0;
  uint64_t v8 = (uint64_t *)&v4[1];
  PCSharedCount::PCSharedCount(v4 + 1);
  OZRenderGraphState::OZRenderGraphState((OZRenderGraphState *)v14);
  if (a3) {
  Render360GroupAsEquirectSentry::Render360GroupAsEquirectSentry((Render360GroupAsEquirectSentry *)v13, (OZImageNode *)a3, (OZRenderParams *)a4);
  }
  (*(void (**)(PC_Sp_counted_base **__return_ptr, void *, void *, unsigned char *, uint64_t))(*(void *)a3 + 176))(&v11, a3, a4, v14, 1);
  v7->var0 = v11;
  PCSharedCount::PCSharedCount(&v17, &v12);
  PCSharedCount::operator=(v8, (uint64_t *)&v17);
  PCSharedCount::~PCSharedCount(&v17);
  PCSharedCount::~PCSharedCount(&v12);
  Render360GroupAsEquirectSentry::~Render360GroupAsEquirectSentry((Render360GroupAsEquirectSentry *)v13);
  PCArray<LiLight,PCArray_Traits<LiLight>>::~PCArray((uint64_t)&v16);
  $EBBD99E4BEE052F512DA5DADC73F537E v9 = (LiImageSource *)std::__list_imp<unsigned int>::clear(v15);
  result.var1.var0 = v10;
  result.var0 = v9;
  return result;
}

- (double)getPixelAspectRatioFromSceneNode:(void *)a3
{
  if (!a3) {
    return 1.0;
  }
  if (v4)
  {
    (*(void (**)(void *))(*(void *)v4 + 1328))(v4);
    if (v5)
    {
      if (result != 1.0) {
        return result;
      }
      goto LABEL_8;
    }
  }
  else
  {
    if (v5)
    {
LABEL_8:
      uint64_t v8 = *(void (**)(void *))(*(void *)v5 + 1792);
      $EBBD99E4BEE052F512DA5DADC73F537E v9 = v5;
LABEL_20:
      v8(v9);
      return result;
    }
    double result = 1.0;
  }
  if (result == 1.0 && v6 != 0)
  {
    uint64_t v8 = *(void (**)(void *))(*(void *)v6 + 40);
    $EBBD99E4BEE052F512DA5DADC73F537E v9 = v6;
    goto LABEL_20;
  }
  return result;
}

- (BOOL)finalizeImage:(id)a3 withSceneNode:(void *)a4 pixelBounds:(PCRect<int>)a5 agent:(void *)a6 andRenderParams:(const void *)a7 atTime:(id)a8
{
  uint64_t v8 = *(const LiAgent **)&a5.var2;
  $EBBD99E4BEE052F512DA5DADC73F537E v9 = *(void **)&a5.var0;
  id v41 = a7;
  unsigned int v40 = *((_DWORD *)a6 + 123);
  if (a4) {
  [(OZFxPlugParameterHandler *)self getFieldMode:&v40 fromFootage:a4];
  }
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  id v38 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v39, (uint64_t)&ptr);
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v38);
  }
  uint64_t v13 = *(OZChannelBase **)v39[0];
  if (!*(void *)v39[0] || (unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->_pluginRemoved), (v14 & 1) != 0))
  {
    BOOL v20 = 0;
  }
  else
  {
    uint64_t v36 = v40;
    int isObjectRef = OZChannelBase::isObjectRef(v13);
    [a3 setFieldOrder:v36];
    [a3 setField:isObjectRef];
    unint64_t PluginNCLC = OZFxPlugSharedBase::getPluginNCLC((id *)&v13->var0, v8);
    int v35 = v16;
    [a3 setNCLCValue:FxConvertPCNCLCCodeToFxNCLCValue(&PluginNCLC)];
    objc_msgSend(a3, "setColorSpace:", OZFxPlugSharedBase::getPluginColorSpace((id *)&v13->var0, v8));
    OZFxPlugSharedBase::getPluginColorDescription((id *)&v13->var0, v8, &v33);
    [a3 setDynamicRangeType:OZFxPlug_ConvertDynamicRangeType(&v33)];
    uint64_t v17 = v9[1];
    v18.i64[0] = (int)*v9;
    v18.i64[1] = (int)HIDWORD(*v9);
    float64x2_t v19 = vcvtq_f64_s64(v18);
    v18.i64[0] = (int)v17;
    v18.i64[1] = SHIDWORD(v17);
    float64x2_t v31 = v19;
    float64x2_t v32 = vcvtq_f64_s64(v18);
    LiAgent::getInversePixelTransform(v8, 0.0, (uint64_t)v30);
    BOOL v20 = PCMatrix44Tmpl<double>::transformRect<double>(v30, v31.f64, (uint64_t)&v31);
    if (v20)
    {
      objc_msgSend(a3, "setBounds:", *(_OWORD *)&v31, *(_OWORD *)&v32);
      BOOL v21 = (long long *)*((void *)v8 + 20);
      long long v22 = v21[3];
      long long v24 = *v21;
      long long v23 = v21[1];
      v29[2] = v21[2];
      v29[3] = v22;
      v29[0] = v24;
      v29[1] = v23;
      long long v25 = v21[7];
      long long v27 = v21[4];
      long long v26 = v21[5];
      v29[6] = v21[6];
      v29[7] = v25;
      v29[4] = v27;
      v29[5] = v26;
      [a3 setPixelTransform:FxMatrixFromPCMatrix((uint64_t)v29)];
    }
    PCCFRef<CGColorSpace *>::~PCCFRef(&v33._pcColorDesc._colorSpaceRef._obj);
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v39);
  return v20;
}

- (void)getLayerOffsetX:(double *)a3 andOffsetY:(double *)a4 fromSceneNode:(void *)a5 withRenderParams:(const void *)a6
{
  if (a5)
  {
    if (v9 && ((unint64_t)a3 | (unint64_t)a4) != 0)
    {
      double v12 = 0.0;
      double v13 = 0.0;
      CMTime v11 = *(CMTime *)a6;
      OZTransformNode::getTranslation(v9, &v13, &v12, &v11);
      if (a3) {
        *a3 = v13;
      }
      if (a4) {
        *a4 = v12;
      }
    }
  }
}

- (BOOL)_setupRenderer
{
  if (!self->_renderer) {
    operator new();
  }
  return 1;
}

- (GLRenderer)renderer
{
  return self->_renderer;
}

- (BOOL)isImageWellMediaFlexoMediaForSceneNode:(void *)a3
{
  return 0;
}

- (void)contextManager
{
  return &self->_threadContextManager;
}

- (unsigned)fxParameterFlagsForChannel:(OZChannelBase *)a3
{
  var0 = a3->var0;
  unint64_t var7 = a3->var7;
  int v8 = ~LODWORD(a3->var7);
  int v9 = ((uint64_t (*)(OZChannelBase *))var0[64])(a3) ^ 1;
  if ((*(void *)&v8 & 0x410020) == 0) {
    v9 |= 0x20202u;
  }
  int v10 = v9 | var7 & 4;
  if (v6 && OZChannelFolder::testFoldFlag(v6, 4)) {
    v10 |= 8u;
  }
  if ((var7 & 0x10) != 0) {
    int v11 = v10 | (2 * var7) & 0x10;
  }
  else {
    int v11 = v10 | (2 * var7) & 0x10 | 0x20;
  }
  if (v5)
  {
    double v14 = 0.0;
    (*(void (**)(void, double *))(**(void **)(v5[14] + 8) + 264))(*(void *)(v5[14] + 8), &v14);
    double v12 = v14;
    if (v14 == -1.79769313e308)
    {
      double v14 = 0.0;
      (*(void (**)(void, double *, double))(**(void **)(v5[14] + 8) + 256))(*(void *)(v5[14] + 8), &v14, v12);
      if (v14 == 1.79769313e308) {
        v11 |= 0x100u;
      }
    }
  }
  return (var7 >> 5) & 0x20000 | (var7 >> 7) & 0x200 | v11;
}

- (id)getAllParameterValuesAtTime:(id *)a3 transactionID:(unint64_t)a4 pluginSessionID:(unint64_t)a5
{
  return 0;
}

- (void)setupImageParamIDs:(void *)a3
{
  channelMap = self->_channelMap;
  uint64_t v4 = (void *)*channelMap;
  if ((void *)*channelMap != channelMap + 1)
  {
    uint64_t v7 = (char *)a3 + 16;
    do
    {
      int v8 = (const void *)v4[5];
      if (v8)
      {
        if (v9)
        {
          int v10 = v9[6];
          double v12 = (_DWORD *)*((void *)a3 + 1);
          unint64_t v11 = *((void *)a3 + 2);
          if ((unint64_t)v12 >= v11)
          {
            double v14 = *(_DWORD **)a3;
            uint64_t v15 = ((uint64_t)v12 - *(void *)a3) >> 2;
            unint64_t v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 62) {
              std::vector<double>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v17 = v11 - (void)v14;
            if (v17 >> 1 > v16) {
              unint64_t v16 = v17 >> 1;
            }
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v18 = v16;
            }
            if (v18)
            {
              float64x2_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)v7, v18);
              double v14 = *(_DWORD **)a3;
              double v12 = (_DWORD *)*((void *)a3 + 1);
            }
            else
            {
              float64x2_t v19 = 0;
            }
            BOOL v20 = &v19[4 * v15];
            *(_DWORD *)BOOL v20 = v10;
            double v13 = v20 + 4;
            while (v12 != v14)
            {
              int v21 = *--v12;
              *((_DWORD *)v20 - 1) = v21;
              v20 -= 4;
            }
            *(void *)a3 = v20;
            *((void *)a3 + 1) = v13;
            *((void *)a3 + 2) = &v19[4 * v18];
            if (v14) {
              operator delete(v14);
            }
          }
          else
          {
            *double v12 = v10;
            double v13 = v12 + 1;
          }
          *((void *)a3 + 1) = v13;
        }
      }
      long long v22 = (void *)v4[1];
      if (v22)
      {
        do
        {
          long long v23 = v22;
          long long v22 = (void *)*v22;
        }
        while (v22);
      }
      else
      {
        do
        {
          long long v23 = (void *)v4[2];
          BOOL v24 = *v23 == (void)v4;
          uint64_t v4 = v23;
        }
        while (!v24);
      }
      uint64_t v4 = v23;
    }
    while (v23 != (void *)self->_channelMap + 1);
  }
}

- (BOOL)hasPathParameters
{
  return self->_hasPathParameters;
}

- (id)transactionForParameterID:(unsigned int)a3 atTime:(id *)a4 transactionID:(unint64_t)a5 pluginSessionID:(unint64_t)a6
{
  cntrl = self->_fxPlugLock.__cntrl_;
  ptr = self->_fxPlugLock.__ptr_;
  int v35 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  OZFxPlugLockSentinel::OZFxPlugLockSentinel(v36, (uint64_t)&ptr);
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v35);
  }
  if (!*(void *)v36[0]) {
    goto LABEL_18;
  }
  unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_pluginRemoved);
  if (v12) {
    goto LABEL_18;
  }
  OZFxPlugSharedBase::getPluginUUID(*(const PCString **)v36[0], &v33);
  double v13 = PCString::ns_str(&v33);
  PCString::~PCString(&v33);
  left = (char *)self->_paramCreationMap.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_18;
  }
  p_pair1 = &self->_paramCreationMap.__tree_.__pair1_;
  do
  {
    unsigned int v16 = *((_DWORD *)left + 8);
    BOOL v17 = v16 >= a3;
    if (v16 >= a3) {
      unint64_t v18 = (char **)left;
    }
    else {
      unint64_t v18 = (char **)(left + 8);
    }
    if (v17) {
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, ParameterTransactionHelpers>, void *>>> *)left;
    }
    left = *v18;
  }
  while (*v18);
  if (p_pair1 != &self->_paramCreationMap.__tree_.__pair1_ && LODWORD(p_pair1[4].__value_.__left_) <= a3)
  {
    channelMap = self->_channelMap;
    BOOL v24 = (char *)channelMap[1];
    long long v22 = (char *)(channelMap + 1);
    long long v23 = v24;
    if (!v24) {
      goto LABEL_31;
    }
    long long v25 = v22;
    do
    {
      unsigned int v26 = *((_DWORD *)v23 + 8);
      BOOL v27 = v26 >= a3;
      if (v26 >= a3) {
        CMTime v28 = (char **)v23;
      }
      else {
        CMTime v28 = (char **)(v23 + 8);
      }
      if (v27) {
        long long v25 = v23;
      }
      long long v23 = *v28;
    }
    while (*v28);
    if (v25 == v22 || *((_DWORD *)v25 + 8) > a3) {
LABEL_31:
    }
      long long v25 = v22;
    uint64_t v29 = *((void *)v25 + 5);
    id v30 = (uint64_t (*)(uint64_t, void, long long *, unint64_t, __CFString *, unint64_t))p_pair1[5].__value_.__left_;
    long long v31 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    float64x2_t v19 = (void *)v30(v29, 0, &v31, a5, v13, a6);
  }
  else
  {
LABEL_18:
    float64x2_t v19 = 0;
  }
  OZFxPlugLockSentinel::~OZFxPlugLockSentinel(v36);
  return v19;
}

- (BOOL)isPerformingBulkChange
{
  return 0;
}

- (BOOL)isColorCorrection
{
  return self->_colorCorrection;
}

- (void)setColorCorrection:(BOOL)a3
{
  self->_colorCorrection = a3;
}

- (void).cxx_destruct
{
  cntrl = self->_fxPlugLock.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  begin = self->_fullWidthCustomParams.__begin_;
  if (begin)
  {
    self->_fullWidthCustomParams.__end_ = begin;
    operator delete(begin);
  }
  std::deque<BOOL>::~deque[abi:ne180100](&self->_suppressChannelChangesStack.c.__map_.__first_);
  OZFxPlugRenderContextManager::~OZFxPlugRenderContextManager(&self->_threadContextManager);
  uint64_t v5 = self->_customParameterList.__begin_;
  if (v5)
  {
    self->_customParameterList.__end_ = v5;
    operator delete(v5);
  }
  left = self->_paramCreationMap.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&self->_paramCreationMap, left);
}

- (id).cxx_construct
{
  self->_paramCreationMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->_paramCreationMap.__tree_.__pair3_.__value_ = 0;
  self->_paramCreationMap.__tree_.__begin_node_ = &self->_paramCreationMap.__tree_.__pair1_;
  self->_customParameterList.__end_ = 0;
  self->_customParameterList.__end_cap_.__value_ = 0;
  self->_customParameterList.__begin_ = 0;
  OZFxPlugRenderContextManager::OZFxPlugRenderContextManager(&self->_threadContextManager);
  *(_OWORD *)&self->_suppressChannelChangesStack.c.__map_.__end_ = 0u;
  *(_OWORD *)&self->_suppressChannelChangesStack.c.__start_ = 0u;
  *(_OWORD *)&self->_suppressChannelChangesStack.c.__map_.__first_ = 0u;
  self->_fullWidthCustomParams.__end_ = 0;
  self->_fullWidthCustomParams.__end_cap_.__value_ = 0;
  self->_fullWidthCustomParams.__begin_ = 0;
  self->_fxPlugLock.__ptr_ = 0;
  self->_fxPlugLock.__cntrl_ = 0;
  return self;
}

@end