@interface MTLToolsDevice
+ (id)newTextureDescriptorFromIOSurface:(__IOSurface *)a3;
+ (id)newTextureDescriptorFromIOSurfaceProperties:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3;
- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats;
- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadsPerThreadgroup;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5 sparsePageSize:(unint64_t)a6;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)tileSizeWithSparsePageSize:(SEL)a3 textureType:(int64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6;
- (BOOL)areBarycentricCoordsSupported;
- (BOOL)areGPUAssertionsEnabled;
- (BOOL)areProgrammableSamplePositionsSupported;
- (BOOL)areRasterOrderGroupsSupported;
- (BOOL)areWritableHeapsEnabled;
- (BOOL)copyShaderCacheToPath:(id)a3;
- (BOOL)deviceOrFeatureProfileSupportsFeatureSet:(unint64_t)a3;
- (BOOL)deviceSupportsFeatureSet:(unint64_t)a3;
- (BOOL)hasUnifiedMemory;
- (BOOL)isAnisoSampleFixSupported;
- (BOOL)isBCTextureCompressionSupported;
- (BOOL)isClampToHalfBorderSupported;
- (BOOL)isCompatibleWithAccelerationStructure:(id)a3;
- (BOOL)isCustomBorderColorSupported;
- (BOOL)isDepth24Stencil8PixelFormatSupported;
- (BOOL)isFixedLinePointFillDepthGradientSupported;
- (BOOL)isFloat32FilteringSupported;
- (BOOL)isHeadless;
- (BOOL)isIntegrated;
- (BOOL)isLargeMRTSupported;
- (BOOL)isLowPower;
- (BOOL)isMsaa32bSupported;
- (BOOL)isPlacementHeapSupported;
- (BOOL)isQuadDataSharingSupported;
- (BOOL)isRGB10A2GammaSupported;
- (BOOL)isRTZRoundingSupported;
- (BOOL)isRemovable;
- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6;
- (BOOL)mapShaderSampleBufferWithBuffer:(id *)a3 capacity:(unint64_t)a4 size:(unint64_t)a5;
- (BOOL)metalAssertionsEnabled;
- (BOOL)requiresBFloat16Emulation;
- (BOOL)requiresRaytracingEmulation;
- (BOOL)reserveGPUAddressRange:(_NSRange)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)setCompilerProcessesCount:(int)a3;
- (BOOL)shaderDebugInfoCaching;
- (BOOL)supportPriorityBand;
- (BOOL)supports2DLinearTexArraySPI;
- (BOOL)supports32BitFloatFiltering;
- (BOOL)supports32BitMSAA;
- (BOOL)supports32bpcMSAATextures;
- (BOOL)supports3DASTCTextures;
- (BOOL)supports3DBCTextures;
- (BOOL)supportsASTCHDRTextureCompression;
- (BOOL)supportsASTCTextureCompression;
- (BOOL)supportsAlphaYUVFormats;
- (BOOL)supportsAnisoSampleFix;
- (BOOL)supportsArgumentBuffers;
- (BOOL)supportsArgumentBuffersTier2;
- (BOOL)supportsArrayOfSamplers;
- (BOOL)supportsArrayOfTextures;
- (BOOL)supportsAtomicUlongVoidMinMax;
- (BOOL)supportsBCTextureCompression;
- (BOOL)supportsBGR10A2;
- (BOOL)supportsBaseVertexInstanceDrawing;
- (BOOL)supportsBfloat16Buffers;
- (BOOL)supportsBfloat16Format;
- (BOOL)supportsBinaryArchives;
- (BOOL)supportsBinaryLibraries;
- (BOOL)supportsBlackOrWhiteSamplerBorderColors;
- (BOOL)supportsBufferBoundsChecking;
- (BOOL)supportsBufferPrefetchStatistics;
- (BOOL)supportsBufferWithAddressRanges;
- (BOOL)supportsBufferWithIOSurface;
- (BOOL)supportsBufferlessClientStorageTexture;
- (BOOL)supportsCMPIndirectCommandBuffers;
- (BOOL)supportsColorSpaceConversionMatrixSelection;
- (BOOL)supportsCombinedMSAAStoreAndResolveAction;
- (BOOL)supportsCommandBufferJump;
- (BOOL)supportsCompressedTextureViewSPI;
- (BOOL)supportsComputeCompressedTextureWrite;
- (BOOL)supportsComputeMemoryBarrier;
- (BOOL)supportsConcurrentComputeDispatch;
- (BOOL)supportsConditionalLoadStore;
- (BOOL)supportsCounterSampling:(unint64_t)a3;
- (BOOL)supportsCountingOcclusionQuery;
- (BOOL)supportsCustomBorderColor;
- (BOOL)supportsDeadlineProfile;
- (BOOL)supportsDepthClipMode;
- (BOOL)supportsDepthClipModeClampExtended;
- (BOOL)supportsDeviceCoherency;
- (BOOL)supportsDevicePartitioning;
- (BOOL)supportsDynamicAttributeStride;
- (BOOL)supportsDynamicControlPointCount;
- (BOOL)supportsDynamicLibraries;
- (BOOL)supportsExplicitVisibilityGroups;
- (BOOL)supportsExtendedSamplerLODBiasRange;
- (BOOL)supportsExtendedVertexFormats;
- (BOOL)supportsExtendedXR10Formats;
- (BOOL)supportsExtendedYUVFormats;
- (BOOL)supportsFP32TessFactors;
- (BOOL)supportsFamily:(int64_t)a3;
- (BOOL)supportsFastMathInfNaNPropagation;
- (BOOL)supportsFeatureSet:(unint64_t)a3;
- (BOOL)supportsFillTexture;
- (BOOL)supportsFixedLinePointFillDepthGradient;
- (BOOL)supportsFloat16BCubicFiltering;
- (BOOL)supportsFloat16InfNanFiltering;
- (BOOL)supportsForceSeamsOnCubemaps;
- (BOOL)supportsForkJoin;
- (BOOL)supportsFragmentBufferWrites;
- (BOOL)supportsFragmentOnlyEncoders;
- (BOOL)supportsFunctionPointers;
- (BOOL)supportsFunctionPointersFromMesh;
- (BOOL)supportsFunctionPointersFromRender;
- (BOOL)supportsGFXIndirectCommandBuffers;
- (BOOL)supportsGPUStatistics;
- (BOOL)supportsGlobalVariableBindingInDylibs;
- (BOOL)supportsGlobalVariableBindings;
- (BOOL)supportsGlobalVariableRelocation;
- (BOOL)supportsGlobalVariableRelocationCompute;
- (BOOL)supportsGlobalVariableRelocationRender;
- (BOOL)supportsHeapAccelerationStructureAllocation;
- (BOOL)supportsHeapWithAddressRanges;
- (BOOL)supportsIABHashForTools;
- (BOOL)supportsImageBlockSampleCoverageControl;
- (BOOL)supportsImageBlocks;
- (BOOL)supportsIndirectDrawAndDispatch;
- (BOOL)supportsIndirectStageInRegion;
- (BOOL)supportsIndirectTessellation;
- (BOOL)supportsIndirectTextures;
- (BOOL)supportsIndirectWritableTextures;
- (BOOL)supportsInt64;
- (BOOL)supportsInterchangeTiled;
- (BOOL)supportsInvariantVertexPosition;
- (BOOL)supportsLargeFramebufferConfigs;
- (BOOL)supportsLateEvalEvent;
- (BOOL)supportsLayeredRendering;
- (BOOL)supportsLimitedYUVFormats;
- (BOOL)supportsLinearTexture2DArray;
- (BOOL)supportsLinearTextureFromSharedBuffer;
- (BOOL)supportsLossyCompression;
- (BOOL)supportsMSAADepthResolve;
- (BOOL)supportsMSAADepthResolveFilter;
- (BOOL)supportsMSAAStencilResolve;
- (BOOL)supportsMSAAStencilResolveFilter;
- (BOOL)supportsMemoryOrderAtomics;
- (BOOL)supportsMemorylessRenderTargets;
- (BOOL)supportsMeshRenderDynamicLibraries;
- (BOOL)supportsMeshShaders;
- (BOOL)supportsMeshShadersInICB;
- (BOOL)supportsMipLevelsSmallerThanBlockSize;
- (BOOL)supportsMirrorClampToEdgeSamplerMode;
- (BOOL)supportsMutableTier1ArgumentBuffers;
- (BOOL)supportsNativeHardwareFP16;
- (BOOL)supportsNonPrivateDepthStencilTextures;
- (BOOL)supportsNonPrivateMSAATextures;
- (BOOL)supportsNonSquareTileShaders;
- (BOOL)supportsNonUniformThreadgroupSize;
- (BOOL)supportsNonZeroTextureWriteLOD;
- (BOOL)supportsNorm16BCubicFiltering;
- (BOOL)supportsOpenCLTextureWriteSwizzles;
- (BOOL)supportsPacked32TextureBufferWrites;
- (BOOL)supportsPartialRenderMemoryBarrier;
- (BOOL)supportsPerPlaneCompression;
- (BOOL)supportsPerformanceStateAssertion;
- (BOOL)supportsPipelineLibraries;
- (BOOL)supportsPlacementHeaps;
- (BOOL)supportsPostDepthCoverage;
- (BOOL)supportsPrimitiveMotionBlur;
- (BOOL)supportsPrimitiveRestartOverride;
- (BOOL)supportsPrimitiveType:(unint64_t)a3;
- (BOOL)supportsProgrammableBlending;
- (BOOL)supportsProgrammableSamplePositions;
- (BOOL)supportsPublicXR10Formats;
- (BOOL)supportsPullModelInterpolation;
- (BOOL)supportsQuadGroup;
- (BOOL)supportsQuadReduction;
- (BOOL)supportsQuadShufflesAndBroadcast;
- (BOOL)supportsQueryTextureLOD;
- (BOOL)supportsRGBA10A2Gamma;
- (BOOL)supportsRTZRounding;
- (BOOL)supportsRasterOrderGroups;
- (BOOL)supportsRasterOrderGroupsColorAttachment;
- (BOOL)supportsRasterizationRateMapWithLayerCount:(unint64_t)a3;
- (BOOL)supportsRayTracingAccelerationStructureCPUDeserialization;
- (BOOL)supportsRayTracingBuffersFromTables;
- (BOOL)supportsRayTracingCurves;
- (BOOL)supportsRayTracingDirectIntersectionResultAccess;
- (BOOL)supportsRayTracingExtendedVertexFormats;
- (BOOL)supportsRayTracingGPUTableUpdateBuffers;
- (BOOL)supportsRayTracingICBs;
- (BOOL)supportsRayTracingIndirectInstanceAccelerationStructureBuild;
- (BOOL)supportsRayTracingMatrixLayout;
- (BOOL)supportsRayTracingMultiLevelInstancing;
- (BOOL)supportsRayTracingPerComponentMotionInterpolation;
- (BOOL)supportsRayTracingPerPrimitiveData;
- (BOOL)supportsRayTracingTraversalMetrics;
- (BOOL)supportsRaytracing;
- (BOOL)supportsRaytracingFromRender;
- (BOOL)supportsReadWriteBufferArguments;
- (BOOL)supportsReadWriteTextureArguments;
- (BOOL)supportsReadWriteTextureArgumentsTier2;
- (BOOL)supportsReadWriteTextureCubeArguments;
- (BOOL)supportsRelaxedTextureViewRequirements;
- (BOOL)supportsRenderDynamicLibraries;
- (BOOL)supportsRenderMemoryBarrier;
- (BOOL)supportsRenderPassWithoutRenderTarget;
- (BOOL)supportsRenderTargetTextureRotation;
- (BOOL)supportsRenderTextureWrites;
- (BOOL)supportsRenderToLinearTextures;
- (BOOL)supportsResourceDetachBacking;
- (BOOL)supportsResourceHeaps;
- (BOOL)supportsSIMDGroup;
- (BOOL)supportsSIMDGroupMatrix;
- (BOOL)supportsSIMDReduction;
- (BOOL)supportsSIMDShuffleAndFill;
- (BOOL)supportsSIMDShufflesAndBroadcast;
- (BOOL)supportsSRGBwrites;
- (BOOL)supportsSampleCount:(unint64_t)a3;
- (BOOL)supportsSamplerAddressModeClampToHalfBorder;
- (BOOL)supportsSamplerCompareFunction;
- (BOOL)supportsSeparateDepthStencil;
- (BOOL)supportsSeparateVisibilityAndShadingRate;
- (BOOL)supportsSetThreadgroupPackingDisabled;
- (BOOL)supportsShaderBarycentricCoordinates;
- (BOOL)supportsShaderLODAverage;
- (BOOL)supportsShaderMinLODClamp;
- (BOOL)supportsSharedFunctionTables;
- (BOOL)supportsSharedStorageHeapResources;
- (BOOL)supportsSharedStorageTextures;
- (BOOL)supportsSharedTextureHandles;
- (BOOL)supportsSparseDepthAttachments;
- (BOOL)supportsSparseHeaps;
- (BOOL)supportsSparseTextures;
- (BOOL)supportsStackOverflowErrorCode;
- (BOOL)supportsStatefulDynamicLibraries;
- (BOOL)supportsStencilFeedback;
- (BOOL)supportsStreamingCodecSignaling;
- (BOOL)supportsTLS;
- (BOOL)supportsTessellation;
- (BOOL)supportsTexture2DMultisampleArray;
- (BOOL)supportsTextureCubeArray;
- (BOOL)supportsTextureOutOfBoundsReads;
- (BOOL)supportsTextureSampleCount:(unint64_t)a3;
- (BOOL)supportsTextureSwizzle;
- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3;
- (BOOL)supportsTileShaders;
- (BOOL)supportsUnalignedVertexFetch;
- (BOOL)supportsVariableRateRasterization;
- (BOOL)supportsVertexAmplification;
- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3;
- (BOOL)supportsViewportAndScissorArray;
- (BOOL)supportsVirtualSubstreams;
- (BOOL)supportsWritableArrayOfTextures;
- (BOOL)supportsYCBCRFormats;
- (BOOL)supportsYCBCRFormats12;
- (BOOL)supportsYCBCRFormatsPQ;
- (BOOL)supportsYCBCRFormatsXR;
- (BOOL)supportsYCBCRPackedFormats12;
- (BOOL)supportsYCBCRPackedFormatsPQ;
- (BOOL)supportsYCBCRPackedFormatsXR;
- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5;
- (BOOL)validateDynamicLibraryDescriptor:(id)a3 error:(id *)a4;
- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4;
- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities;
- (MTLArchitecture)architecture;
- (MTLCompilerConnectionManager)getCompilerConnectionManager:(int)a3;
- (MTLGPUBVHBuilder)GPUBVHBuilder;
- (MTLTargetDeviceArchitecture)targetDeviceArchitecture;
- (MTLToolsDevice)initWithBaseObject:(id)a3 parent:(id)a4;
- (NSArray)counterSets;
- (NSDictionary)pluginData;
- (NSString)name;
- (const)limits;
- (const)targetDeviceInfo;
- (float)maxLineWidth;
- (float)maxPointSize;
- (id)_deviceWrapper;
- (id)copyIOSurfaceSharedTextureProperties:(id)a3;
- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5;
- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4;
- (id)endCollectingPipelineDescriptors;
- (id)familyName;
- (id)getDepthStencilStateForBaseObject:(id)a3 descriptor:(id)a4;
- (id)getDynamicLibraryForBaseObject:(id)a3;
- (id)getFunctionForBaseObject:(id)a3 library:(id)a4;
- (id)getMostCompatibleArchitecture:(id)a3;
- (id)getSamplerStateForBaseObject:(id)a3 descriptor:(id)a4;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)lookupRecompiledBinaryArchive:(id)a3;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4;
- (id)newArgumentEncoderWithArguments:(id)a3;
- (id)newArgumentEncoderWithArguments:(id)a3 structType:(id *)a4;
- (id)newArgumentEncoderWithBufferBinding:(id)a3;
- (id)newArgumentEncoderWithLayout:(id)a3;
- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4;
- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6 deallocator:(id)a7;
- (id)newBufferWithDescriptor:(id)a3;
- (id)newBufferWithIOSurface:(__IOSurface *)a3;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 gpuAddress:(unint64_t)a5;
- (id)newCommandQueue;
- (id)newCommandQueueWithDescriptor:(id)a3;
- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3;
- (id)newComputePipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4;
- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4;
- (id)newDagStringWithGraphs:(id)a3;
- (id)newDefaultLibrary;
- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4;
- (id)newDepthStencilStateWithDescriptor:(id)a3;
- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5;
- (id)newDynamicLibrary:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newEvent;
- (id)newEventWithOptions:(int64_t)a3;
- (id)newFence;
- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newHeapWithDescriptor:(id)a3;
- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4;
- (id)newIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5;
- (id)newIOHandleWithURL:(id)a3 error:(id *)a4;
- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3;
- (id)newIndirectArgumentEncoderWithLayout:(id)a3;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIndirectComputeCommandEncoderWithBuffer:(id)a3;
- (id)newIndirectRenderCommandEncoderWithBuffer:(id)a3;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newLateEvalEvent;
- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5;
- (id)newLibraryWithData:(id)a3 error:(id *)a4;
- (id)newLibraryWithFile:(id)a3 error:(id *)a4;
- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4;
- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4;
- (id)newLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newLogStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4;
- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4;
- (id)newProfileWithExecutionSize:(unint64_t)a3;
- (id)newRasterizationRateMapWithDescriptor:(id)a3;
- (id)newRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4;
- (id)newResourceGroupFromResources:(const void *)a3 count:(unint64_t)a4;
- (id)newSamplerStateWithDescriptor:(id)a3;
- (id)newSharedEvent;
- (id)newSharedEventWithHandle:(id)a3;
- (id)newSharedEventWithMachPort:(unsigned int)a3;
- (id)newSharedEventWithOptions:(int64_t)a3;
- (id)newSharedTextureWithDescriptor:(id)a3;
- (id)newSharedTextureWithHandle:(id)a3;
- (id)newSharedTextureWithHandle:(id)a3 withResourceIndex:(unint64_t)a4;
- (id)newStructTypeWithSerializedData:(id)a3;
- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4;
- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5;
- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (id)productName;
- (id)serializeRenderPipelineDescriptor:(id)a3;
- (id)serializeStructType:(id)a3;
- (id)unwrapMTLCommandBufferDescriptor:(id)a3 alwaysCopy:(BOOL)a4;
- (id)unwrapMTLCompileOptions:(id)a3;
- (id)unwrapMTLComputePipelineDescriptor:(id)a3;
- (id)unwrapMTLDynamicLibraryDescriptorSPI:(id)a3;
- (id)unwrapMTLFunctionDescriptor:(id)a3;
- (id)unwrapMTLMeshRenderPipelineDescriptor:(id)a3;
- (id)unwrapMTLRelocations:(id)a3;
- (id)unwrapMTLRenderPipelineDescriptor:(id)a3;
- (id)unwrapMTLStitchedLibraryDescriptor:(id)a3;
- (id)unwrapMTLTileRenderPipelineDescriptor:(id)a3;
- (id)vendorName;
- (int64_t)currentPerformanceState;
- (int64_t)defaultTextureWriteRoundingMode;
- (unint64_t)argumentBuffersSupport;
- (unint64_t)bufferRobustnessSupport;
- (unint64_t)commandBufferErrorOptions;
- (unint64_t)currentAllocatedSize;
- (unint64_t)debugPipelineOptions:(unint64_t)a3 includePipelinePerfStats:(BOOL)a4;
- (unint64_t)dedicatedMemorySize;
- (unint64_t)deviceCreationFlags;
- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes;
- (unint64_t)deviceLinearTextureAlignmentBytes;
- (unint64_t)doubleFPConfig;
- (unint64_t)featureProfile;
- (unint64_t)getSupportedCommandBufferErrorOptions;
- (unint64_t)halfFPConfig;
- (unint64_t)iosurfaceReadOnlyTextureAlignmentBytes;
- (unint64_t)iosurfaceTextureAlignmentBytes;
- (unint64_t)latestSupportedGenericBVHVersion;
- (unint64_t)linearTextureAlignmentBytes;
- (unint64_t)linearTextureArrayAlignmentBytes;
- (unint64_t)linearTextureArrayAlignmentSlice;
- (unint64_t)maxAccelerationStructureLevels;
- (unint64_t)maxAccelerationStructureTraversalDepth;
- (unint64_t)maxArgumentBufferSamplerCount;
- (unint64_t)maxBufferLength;
- (unint64_t)maxColorAttachments;
- (unint64_t)maxComputeAttributes;
- (unint64_t)maxComputeBuffers;
- (unint64_t)maxComputeInlineDataSize;
- (unint64_t)maxComputeLocalMemorySizes;
- (unint64_t)maxComputeSamplers;
- (unint64_t)maxComputeTextures;
- (unint64_t)maxComputeThreadgroupMemory;
- (unint64_t)maxComputeThreadgroupMemoryAlignmentBytes;
- (unint64_t)maxConstantBufferArguments;
- (unint64_t)maxCustomSamplePositions;
- (unint64_t)maxFenceInstances;
- (unint64_t)maxFragmentBuffers;
- (unint64_t)maxFragmentInlineDataSize;
- (unint64_t)maxFragmentSamplers;
- (unint64_t)maxFragmentTextures;
- (unint64_t)maxFramebufferStorageBits;
- (unint64_t)maxFunctionConstantIndices;
- (unint64_t)maxIOCommandsInFlight;
- (unint64_t)maxIndirectBuffers;
- (unint64_t)maxIndirectSamplers;
- (unint64_t)maxIndirectSamplersPerDevice;
- (unint64_t)maxIndirectTextures;
- (unint64_t)maxInterpolants;
- (unint64_t)maxInterpolatedComponents;
- (unint64_t)maxPredicatedNestingDepth;
- (unint64_t)maxRasterizationRateLayerCount;
- (unint64_t)maxTessellationFactor;
- (unint64_t)maxTextureBufferWidth;
- (unint64_t)maxTextureDepth3D;
- (unint64_t)maxTextureDimensionCube;
- (unint64_t)maxTextureHeight2D;
- (unint64_t)maxTextureHeight3D;
- (unint64_t)maxTextureLayers;
- (unint64_t)maxTextureWidth1D;
- (unint64_t)maxTextureWidth2D;
- (unint64_t)maxTextureWidth3D;
- (unint64_t)maxThreadgroupMemoryLength;
- (unint64_t)maxTileBuffers;
- (unint64_t)maxTileInlineDataSize;
- (unint64_t)maxTileSamplers;
- (unint64_t)maxTileTextures;
- (unint64_t)maxTotalComputeThreadsPerThreadgroup;
- (unint64_t)maxVertexAmplificationCount;
- (unint64_t)maxVertexAmplificationFactor;
- (unint64_t)maxVertexAttributes;
- (unint64_t)maxVertexBuffers;
- (unint64_t)maxVertexInlineDataSize;
- (unint64_t)maxVertexSamplers;
- (unint64_t)maxVertexTextures;
- (unint64_t)maxViewportCount;
- (unint64_t)maxVisibilityQueryOffset;
- (unint64_t)memorySize;
- (unint64_t)minBufferNoCopyAlignmentBytes;
- (unint64_t)minConstantBufferAlignmentBytes;
- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3;
- (unint64_t)minTilePixels;
- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3;
- (unint64_t)minimumTextureBufferAlignmentForPixelFormat:(unint64_t)a3;
- (unint64_t)readWriteTextureSupport;
- (unint64_t)recommendedMaxWorkingSetSize;
- (unint64_t)registryID;
- (unint64_t)resourcePatchingTypeForResourceType:(unint64_t)a3;
- (unint64_t)sharedMemorySize;
- (unint64_t)singleFPConfig;
- (unint64_t)sparseTexturesSupport;
- (unint64_t)sparseTileSizeInBytes;
- (unint64_t)sparseTileSizeInBytesForSparsePageSize:(int64_t)a3;
- (unsigned)acceleratorPort;
- (unsigned)maximumComputeSubstreams;
- (void)_setDeviceWrapper:(id)a3;
- (void)allowLibrariesFromOtherPlatforms;
- (void)compilerPropagatesThreadPriority:(BOOL)a3;
- (void)convertSparsePixelRegions:(id *)a3 toTileRegions:(id *)a4 withTileSize:(id *)a5 alignmentMode:(unint64_t)a6 numRegions:(unint64_t)a7;
- (void)convertSparseTileRegions:(id *)a3 toPixelRegions:(id *)a4 withTileSize:(id *)a5 numRegions:(unint64_t)a6;
- (void)dealloc;
- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5;
- (void)getDefaultSamplePositions:(id *)a3 count:(unint64_t)a4;
- (void)getShaderCacheKeys;
- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)reserveResourceIndicesForResourceType:(unint64_t)a3 indices:(unint64_t *)a4 indexCount:(unint64_t)a5;
- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4;
- (void)setCommandBufferErrorOptions:(unint64_t)a3;
- (void)setGPUAssertionsEnabled:(BOOL)a3;
- (void)setMetalAssertionsEnabled:(BOOL)a3;
- (void)setPluginData:(id)a3;
- (void)setShaderDebugInfoCaching:(BOOL)a3;
- (void)setWritableHeapsEnabled:(BOOL)a3;
- (void)setupMPSFunctionTable:(MPSFunctionTable *)a3;
- (void)startCollectingPipelineDescriptors;
- (void)unloadShaderCaches;
- (void)unmapShaderSampleBuffer;
@end

@implementation MTLToolsDevice

- (MTLToolsDevice)initWithBaseObject:(id)a3 parent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTLToolsDevice;
  v4 = [(MTLToolsObject *)&v7 initWithBaseObject:a3 parent:a4];
  v5 = v4;
  if (v4)
  {
    objc_msgSend(-[MTLToolsObject baseObject](v4, "baseObject"), "_setDeviceWrapper:", v4);
    v5->super._device = v5;
    v5->functionHandleObjectCache = objc_alloc_init(MTLToolsObjectCache);
    v5->dynamicLibraryObjectCache = objc_alloc_init(MTLToolsObjectCache);
    v5->sourceLibraryObjectCache = objc_alloc_init(MTLToolsObjectCache);
    v5->functionObjectCache = objc_alloc_init(MTLToolsObjectCache);
    v5->depthStencilObjectCache = objc_alloc_init(MTLToolsObjectCache);
    v5->samplerObjectCache = objc_alloc_init(MTLToolsObjectCache);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLToolsDevice;
  [(MTLToolsObject *)&v3 dealloc];
}

- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLCoreIR:functionType:", a3, a4);
  if (result)
  {
    id v6 = result;
    objc_super v7 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLCoreIR:inputsDescription:functionType:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    v8 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLESIR:functionType:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newLogStateWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return (id)[v6 newLogStateWithDescriptor:a3 error:a4];
}

- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLESIR:inputsDescription:functionType:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    v8 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLIR:functionType:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFunctionWithGLIR:inputsDescription:functionType:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    v8 = [(MTLToolsObject *)[MTLToolsFunction alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (BOOL)shaderDebugInfoCaching
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 shaderDebugInfoCaching];
}

- (void)setShaderDebugInfoCaching:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setShaderDebugInfoCaching:v3];
}

- (BOOL)mapShaderSampleBufferWithBuffer:(id *)a3 capacity:(unint64_t)a4 size:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  return [v8 mapShaderSampleBufferWithBuffer:a3 capacity:a4 size:a5];
}

- (void)unmapShaderSampleBuffer
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 unmapShaderSampleBuffer];
}

- (BOOL)supportsRaytracing
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRaytracing];
}

- (BOOL)requiresRaytracingEmulation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 requiresRaytracingEmulation];
}

- (MTLGPUBVHBuilder)GPUBVHBuilder
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLGPUBVHBuilder *)[v2 GPUBVHBuilder];
}

- (unint64_t)latestSupportedGenericBVHVersion
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 latestSupportedGenericBVHVersion];
}

- (NSString)name
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 name];
}

- (unint64_t)registryID
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 registryID];
}

- (MTLArchitecture)architecture
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLArchitecture *)[v2 architecture];
}

- (id)getMostCompatibleArchitecture:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 getMostCompatibleArchitecture:a3];
}

- (id)vendorName
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 vendorName];
}

- (id)familyName
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 familyName];
}

- (id)productName
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 productName];
}

- (const)targetDeviceInfo
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (const MTLTargetDeviceArch *)[v2 targetDeviceInfo];
}

- (MTLTargetDeviceArchitecture)targetDeviceArchitecture
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (MTLTargetDeviceArchitecture *)[v2 targetDeviceArchitecture];
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4
{
  return [(MTLToolsDevice *)self loadDynamicLibrariesForComputeDescriptor:a3 options:0 error:a4];
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "loadDynamicLibrariesForComputeDescriptor:options:error:", -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", a3), a4, a5);
  if (!v6) {
    return 0;
  }
  id v7 = (void *)v6;
  id v8 = objc_opt_new();
  v9 = (void *)MEMORY[0x23ECD5710]();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v8, "addObject:", -[MTLToolsDevice getDynamicLibraryForBaseObject:](self, "getDynamicLibraryForBaseObject:", *(void *)(*((void *)&v15 + 1) + 8 * v13++)));
      }
      while (v11 != v13);
      uint64_t v11 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5
{
  return [(MTLToolsDevice *)self loadDynamicLibrariesForFunction:a3 insertLibraries:a4 options:0 error:a5];
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a4, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v12 = [a4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(a4);
        }
        objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v15++), "baseObject"));
      }
      while (v13 != v15);
      uint64_t v13 = [a4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);
  }
  long long v16 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "loadDynamicLibrariesForFunction:insertLibraries:options:error:", objc_msgSend(a3, "baseObject"), v11, a5, a6);

  if (!v16) {
    return 0;
  }
  long long v17 = objc_opt_new();
  long long v18 = (void *)MEMORY[0x23ECD5710]();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v19 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(v17, "addObject:", -[MTLToolsDevice getDynamicLibraryForBaseObject:](self, "getDynamicLibraryForBaseObject:", *(void *)(*((void *)&v24 + 1) + 8 * v22++)));
      }
      while (v20 != v22);
      uint64_t v20 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v20);
  }

  return v17;
}

- (id)unwrapMTLDynamicLibraryDescriptorSPI:(id)a3
{
  id v4 = (void *)[a3 copy];
  objc_msgSend(v4, "setLibrary:", objc_msgSend((id)objc_msgSend(a3, "library"), "baseObject"));
  return v4;
}

- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = [(MTLToolsObject *)self baseObject];

  return [v8 validateDynamicLibrary:a3 state:v6 error:a5];
}

- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return [v6 validateDynamicLibraryURL:a3 error:a4];
}

- (BOOL)areGPUAssertionsEnabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 areGPUAssertionsEnabled];
}

- (void)setGPUAssertionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setGPUAssertionsEnabled:v3];
}

- (BOOL)areWritableHeapsEnabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 areWritableHeapsEnabled];
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setWritableHeapsEnabled:v3];
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 gpuAddress:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  return (id)[v8 newBufferWithLength:a3 options:a4 gpuAddress:a5];
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];

  return (id)[v10 newBufferWithBytes:a3 length:a4 options:a5 gpuAddress:a6];
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6 deallocator:(id)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];

  return (id)[v12 newBufferWithBytesNoCopy:a3 length:a4 options:a5 gpuAddress:a6 deallocator:a7];
}

- (BOOL)reserveGPUAddressRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(MTLToolsObject *)self baseObject];

  return objc_msgSend(v5, "reserveGPUAddressRange:", location, length);
}

- (id)newBufferWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsResource *)[MTLToolsBuffer alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

+ (id)newTextureDescriptorFromIOSurfaceProperties:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_alloc_init(MEMORY[0x263F12A50]);
  objc_msgSend(v4, "setTextureType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12D00]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setPixelFormat:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12CD8]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setWidth:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12D10]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setHeight:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12CC8]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setDepth:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12CB8]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setMipmapLevelCount:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12CD0]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setSampleCount:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12CE8]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setArrayLength:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12CB0]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setResourceOptions:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12CE0]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setUsage:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12D08]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setSparseSurfaceDefaultValue:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12CF0]), "unsignedIntegerValue"));
  objc_msgSend(v4, "setAllowGPUOptimizedContents:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12CC0]), "BOOLValue"));
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F12CF8]), "unsignedIntegerValue");
  [v4 setSwizzle:MTLTextureSwizzleKeyToChannels()];
  return v4;
}

+ (id)newTextureDescriptorFromIOSurface:(__IOSurface *)a3
{
  id v4 = (void *)IOSurfaceCopyValue(a3, (CFStringRef)*MEMORY[0x263F0EDA8]);
  id v5 = (void *)[a1 newTextureDescriptorFromIOSurfaceProperties:v4];

  return v5;
}

- (id)newSharedTextureWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsResource *)[MTLToolsTexture alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newSharedTextureWithHandle:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureWithHandle:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsResource *)[MTLToolsTexture alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newSharedTextureWithHandle:(id)a3 withResourceIndex:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedTextureWithHandle:withResourceIndex:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsResource *)[MTLToolsTexture alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)copyIOSurfaceSharedTextureProperties:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 copyIOSurfaceSharedTextureProperties:a3];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadsPerThreadgroup
{
  id result = [(MTLToolsObject *)self baseObject];
  if (result)
  {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result maxThreadsPerThreadgroup];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- (BOOL)isLowPower
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isLowPower];
}

- (BOOL)isHeadless
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isHeadless];
}

- (BOOL)isRemovable
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isRemovable];
}

- (BOOL)hasUnifiedMemory
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 hasUnifiedMemory];
}

- (unint64_t)recommendedMaxWorkingSetSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 recommendedMaxWorkingSetSize];
}

- (unint64_t)sharedMemorySize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 sharedMemorySize];
}

- (unint64_t)dedicatedMemorySize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 dedicatedMemorySize];
}

- (unint64_t)bufferRobustnessSupport
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 bufferRobustnessSupport];
}

- (BOOL)isDepth24Stencil8PixelFormatSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isDepth24Stencil8PixelFormatSupported];
}

- (void)unloadShaderCaches
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 unloadShaderCaches];
}

- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return ($85CD2974BE96D4886BB301820D1C36C2)[v2 libraryCacheStats];
}

- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return ($85CD2974BE96D4886BB301820D1C36C2)[v2 pipelineCacheStats];
}

- (BOOL)copyShaderCacheToPath:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 copyShaderCacheToPath:a3];
}

- (void)getShaderCacheKeys
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (void *)[v2 getShaderCacheKeys];
}

- (void)compilerPropagatesThreadPriority:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 compilerPropagatesThreadPriority:v3];
}

- (id)newCommandQueue
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueue");
  if (result)
  {
    id v4 = result;
    id v5 = [[MTLToolsCommandQueue alloc] initWithBaseObject:result parent:self];

    return v5;
  }
  return result;
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithMaxCommandBufferCount:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [[MTLToolsCommandQueue alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [[MTLToolsCommandQueue alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsResource *)[MTLToolsBuffer alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytes:length:options:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    id v8 = [(MTLToolsResource *)[MTLToolsBuffer alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytesNoCopy:length:options:deallocator:", a3, a4, a5, a6);
  if (result)
  {
    id v8 = result;
    v9 = [(MTLToolsResource *)[MTLToolsBuffer alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCount:(unint64_t)a4 options:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  return (id)[v8 newIndirectCommandBufferWithDescriptor:a3 maxCount:a4 options:a5];
}

- (id)newIndirectRenderCommandEncoderWithBuffer:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 newIndirectRenderCommandEncoderWithBuffer:a3];
}

- (id)newIndirectComputeCommandEncoderWithBuffer:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 newIndirectComputeCommandEncoderWithBuffer:a3];
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    id v8 = [(MTLToolsResource *)[MTLToolsIndirectCommandBuffer alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithBytesNoCopy:length:descriptor:deallocator:", a3, a4, a5, a6);
  if (result)
  {
    id v8 = result;
    v9 = [(MTLToolsResource *)[MTLToolsTexture alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (id)newDepthStencilStateWithDescriptor:(id)a3
{
  id v5 = (void *)-[MTLToolsObject newDepthStencilStateWithDescriptor:](self->super._baseObject, "newDepthStencilStateWithDescriptor:");
  id v6 = [(MTLToolsDevice *)self getDepthStencilStateForBaseObject:v5 descriptor:a3];

  return v6;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsResource *)[MTLToolsTexture alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newSamplerStateWithDescriptor:(id)a3
{
  id v5 = (void *)-[MTLToolsObject newSamplerStateWithDescriptor:](self->super._baseObject, "newSamplerStateWithDescriptor:");
  id v6 = [(MTLToolsDevice *)self getSamplerStateForBaseObject:v5 descriptor:a3];

  return v6;
}

- (id)newDefaultLibrary
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDefaultLibrary");
  if (result)
  {
    id v4 = result;
    id v5 = [(MTLToolsObject *)[MTLToolsLibrary alloc] initWithBaseObject:result parent:self];

    return v5;
  }
  return result;
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDefaultLibraryWithBundle:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsLibrary alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithFile:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsLibrary alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithURL:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsLibrary alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithSource:options:error:", a3, -[MTLToolsDevice unwrapMTLCompileOptions:](self, "unwrapMTLCompileOptions:", a4), a5);
  if (!v6) {
    return 0;
  }
  id v7 = (void *)v6;
  sourceLibraryObjectCache = self->sourceLibraryObjectCache;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__MTLToolsDevice_newLibraryWithSource_options_error___block_invoke;
  v11[3] = &unk_264E12F68;
  v11[4] = v7;
  v11[5] = self;
  id v9 = [(MTLToolsObjectCache *)sourceLibraryObjectCache getCachedObjectForKey:v7 onMiss:v11];

  return v9;
}

uint64_t __53__MTLToolsDevice_newLibraryWithSource_options_error___block_invoke(uint64_t a1)
{
  id v2 = [MTLToolsLibrary alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return (uint64_t)[(MTLToolsObject *)v2 initWithBaseObject:v3 parent:v4];
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithData:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsLibrary alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (void)startCollectingPipelineDescriptors
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 startCollectingPipelineDescriptors];
}

- (id)endCollectingPipelineDescriptors
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 endCollectingPipelineDescriptors];
}

- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newPipelineLibraryWithFilePath:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsPipelineLibrary alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)serializeRenderPipelineDescriptor:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 serializeRenderPipelineDescriptor:a3];
}

- (id)newRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return (id)[v6 newRenderPipelineDescriptorWithSerializedData:a3 deserializationContext:a4];
}

- (id)newComputePipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  return (id)[v6 newComputePipelineDescriptorWithSerializedData:a3 deserializationContext:a4];
}

- (id)serializeStructType:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 serializeStructType:a3];
}

- (id)newStructTypeWithSerializedData:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 newStructTypeWithSerializedData:a3];
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  unint64_t v5 = [v4 heapTextureSizeAndAlignWithDescriptor:a3];
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  unint64_t v7 = [v6 heapBufferSizeAndAlignWithLength:a3 options:a4];
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (id)newHeapWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newHeapWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLToolsHeap alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newFence
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFence");
  if (result)
  {
    id v4 = result;
    id v5 = [(MTLToolsObject *)[MTLToolsFence alloc] initWithBaseObject:result parent:self];

    return v5;
  }
  return result;
}

- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (IndirectArgumentBufferCapabilities)[v2 indirectArgumentBufferCapabilities];
}

- (NSDictionary)pluginData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSDictionary *)[v2 pluginData];
}

- (void)setPluginData:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setPluginData:a3];
}

- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 newIndirectArgumentBufferLayoutWithStructType:a3];
}

- (id)newIndirectArgumentEncoderWithLayout:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 newIndirectArgumentEncoderWithLayout:a3];
}

- (id)newArgumentEncoderWithLayout:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 newArgumentEncoderWithLayout:a3];
}

- (id)newArgumentEncoderWithArguments:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithArguments:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLToolsArgumentEncoder alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newArgumentEncoderWithArguments:(id)a3 structType:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithArguments:structType:", a3, a4);
  if (result)
  {
    id v6 = result;
    unint64_t v7 = [(MTLToolsObject *)[MTLToolsArgumentEncoder alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (unint64_t)maxThreadgroupMemoryLength
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxThreadgroupMemoryLength];
}

- (unint64_t)maxArgumentBufferSamplerCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxArgumentBufferSamplerCount];
}

- (id)unwrapMTLRenderPipelineDescriptor:(id)a3
{
  id v4 = (void *)[a3 copy];
  objc_msgSend(v4, "setVertexFunction:", objc_msgSend((id)objc_msgSend(v4, "vertexFunction"), "baseObject"));
  objc_msgSend(v4, "setFragmentFunction:", objc_msgSend((id)objc_msgSend(v4, "fragmentFunction"), "baseObject"));
  objc_msgSend(v4, "setPipelineLibrary:", objc_msgSend((id)objc_msgSend(v4, "pipelineLibrary"), "baseObject"));
  objc_msgSend(v4, "setVertexLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "vertexLinkedFunctions")));
  objc_msgSend(v4, "setFragmentLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "fragmentLinkedFunctions")));
  objc_msgSend(v4, "setMeshLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "meshLinkedFunctions")));
  objc_msgSend(v4, "setObjectLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "objectLinkedFunctions")));
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(a3, "binaryArchives")));
  objc_msgSend(v4, "setVertexPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "vertexPreloadedLibraries")));
  objc_msgSend(v4, "setFragmentPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "fragmentPreloadedLibraries")));
  objc_msgSend(v4, "setObjectFunction:", objc_msgSend((id)objc_msgSend(a3, "objectFunction"), "baseObject"));
  objc_msgSend(v4, "setMeshFunction:", objc_msgSend((id)objc_msgSend(a3, "meshFunction"), "baseObject"));
  objc_msgSend(v4, "setObjectPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "objectPreloadedLibraries")));
  objc_msgSend(v4, "setMeshPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "meshPreloadedLibraries")));

  return v4;
}

- (unint64_t)debugPipelineOptions:(unint64_t)a3 includePipelinePerfStats:(BOOL)a4
{
  if ((a3 & 4) == 0 && a4) {
    uint64_t v4 = 8716291;
  }
  else {
    uint64_t v4 = 8454147;
  }
  return v4 | a3;
}

- (id)unwrapMTLComputePipelineDescriptor:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  objc_msgSend(v4, "setComputeFunction:", objc_msgSend((id)objc_msgSend(v4, "computeFunction"), "baseObject"));
  objc_msgSend(v4, "setPipelineLibrary:", objc_msgSend((id)objc_msgSend(v4, "pipelineLibrary"), "baseObject"));
  objc_msgSend(v4, "setLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "linkedFunctions")));
  objc_msgSend(v4, "setFunctionPointers:", unwrapArray((NSArray *)objc_msgSend(a3, "functionPointers")));
  objc_msgSend(v4, "setPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "preloadedLibraries")));
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(a3, "binaryArchives")));

  return v4;
}

- (id)unwrapMTLTileRenderPipelineDescriptor:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  objc_msgSend(v4, "setTileFunction:", objc_msgSend((id)objc_msgSend(v4, "tileFunction"), "baseObject"));
  objc_msgSend(v4, "setLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "linkedFunctions")));
  objc_msgSend(v4, "setPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "preloadedLibraries")));
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(v4, "binaryArchives")));

  return v4;
}

- (id)unwrapMTLMeshRenderPipelineDescriptor:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  objc_msgSend(v4, "setObjectFunction:", objc_msgSend((id)objc_msgSend(a3, "objectFunction"), "baseObject"));
  objc_msgSend(v4, "setMeshFunction:", objc_msgSend((id)objc_msgSend(a3, "meshFunction"), "baseObject"));
  objc_msgSend(v4, "setFragmentFunction:", objc_msgSend((id)objc_msgSend(a3, "fragmentFunction"), "baseObject"));
  objc_msgSend(v4, "setPipelineLibrary:", objc_msgSend((id)objc_msgSend(a3, "pipelineLibrary"), "baseObject"));
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(a3, "binaryArchives")));
  objc_msgSend(v4, "setObjectPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "objectPreloadedLibraries")));
  objc_msgSend(v4, "setMeshPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "meshPreloadedLibraries")));
  objc_msgSend(v4, "setFragmentPreloadedLibraries:", unwrapArray((NSArray *)objc_msgSend(a3, "fragmentPreloadedLibraries")));
  objc_msgSend(v4, "setObjectLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "objectLinkedFunctions")));
  objc_msgSend(v4, "setMeshLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "meshLinkedFunctions")));
  objc_msgSend(v4, "setFragmentLinkedFunctions:", unwrapLinkedFunctions((MTLLinkedFunctions *)objc_msgSend(a3, "fragmentLinkedFunctions")));

  return v4;
}

- (id)unwrapMTLCompileOptions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[a3 copy];
  uint64_t v4 = (void *)[v3 libraries];
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "baseObject"));
        }
        while (v8 != v10);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setLibraries:v6];
  }
  return v3;
}

- (id)unwrapMTLStitchedLibraryDescriptor:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  objc_msgSend(v4, "setFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "functions")));
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(a3, "binaryArchives")));
  return v4;
}

- (id)unwrapMTLRelocations:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F127E8]), "initWithSymbolName:buffer:offset:", objc_msgSend(v9, "symbolName"), objc_msgSend((id)objc_msgSend(v9, "buffer"), "baseObject"), objc_msgSend(v9, "offset"));
          [v4 addObject:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v4 addObject:v9];
          }
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)unwrapMTLFunctionDescriptor:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  objc_msgSend(v4, "setBinaryArchives:", unwrapArray((NSArray *)objc_msgSend(a3, "binaryArchives")));
  objc_msgSend(v4, "setPrivateFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "privateFunctions")));
  return v4;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:error:", -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:", a3), a4);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:", a3), a4, a5, a6);
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = [(MTLToolsDevice *)self unwrapMTLRenderPipelineDescriptor:a3];
  id v9 = [(MTLToolsObject *)self baseObject];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__MTLToolsDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v10[3] = &unk_264E12F90;
  v10[4] = self;
  v10[5] = a5;
  [v9 newRenderPipelineStateWithDescriptor:v8 options:a4 completionHandler:v10];
}

void __81__MTLToolsDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  if (a2) {
    a2 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 32)];
  }
  uint64_t v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLRenderPipelineDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__MTLToolsDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E12FB8;
  v8[4] = self;
  v8[5] = a4;
  [v7 newRenderPipelineStateWithDescriptor:v6 completionHandler:v8];
}

void __73__MTLToolsDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  if (a2) {
    a2 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 32)];
  }
  uint64_t v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:error:", -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", a3), a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsComputePipelineState alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", a3), a4, a5, a6);
  id v8 = [(MTLToolsObject *)[MTLToolsComputePipelineState alloc] initWithBaseObject:v7 parent:self];

  return v8;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLComputePipelineDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__MTLToolsDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E12FE0;
  v8[4] = self;
  v8[5] = a4;
  [v7 newComputePipelineStateWithDescriptor:v6 completionHandler:v8];
}

void __74__MTLToolsDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1, MTLToolsComputePipelineState *a2)
{
  if (a2) {
    a2 = [(MTLToolsObject *)[MTLToolsComputePipelineState alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 32)];
  }
  uint64_t v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__MTLToolsDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v11[3] = &unk_264E13008;
  v11[4] = self;
  v11[5] = a5;
  [v9 newComputePipelineStateWithDescriptor:v10 options:a4 completionHandler:v11];
}

void __82__MTLToolsDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLToolsComputePipelineState *a2)
{
  if (a2) {
    a2 = [(MTLToolsObject *)[MTLToolsComputePipelineState alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 32)];
  }
  uint64_t v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:error:", objc_msgSend(a3, "baseObject"), a4);
  id v6 = [(MTLToolsObject *)[MTLToolsComputePipelineState alloc] initWithBaseObject:v5 parent:self];

  return v6;
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:options:reflection:error:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
  id v8 = [(MTLToolsObject *)[MTLToolsComputePipelineState alloc] initWithBaseObject:v7 parent:self];

  return v8;
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  id v7 = [(MTLToolsObject *)self baseObject];
  uint64_t v8 = [a3 baseObject];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__MTLToolsDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke;
  v9[3] = &unk_264E12FE0;
  v9[4] = self;
  v9[5] = a4;
  [v7 newComputePipelineStateWithFunction:v8 completionHandler:v9];
}

void __72__MTLToolsDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke(uint64_t a1, MTLToolsComputePipelineState *a2)
{
  if (a2) {
    a2 = [(MTLToolsObject *)[MTLToolsComputePipelineState alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 32)];
  }
  uint64_t v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__MTLToolsDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v11[3] = &unk_264E13008;
  v11[4] = self;
  v11[5] = a5;
  [v9 newComputePipelineStateWithFunction:v10 options:a4 completionHandler:v11];
}

void __80__MTLToolsDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke(uint64_t a1, MTLToolsComputePipelineState *a2)
{
  if (a2) {
    a2 = [(MTLToolsObject *)[MTLToolsComputePipelineState alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 32)];
  }
  uint64_t v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithTileDescriptor:error:", -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", a3), a4);
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLTileRenderPipelineDescriptor:](self, "unwrapMTLTileRenderPipelineDescriptor:", a3), a4, a5, a6);
  if (result)
  {
    id v8 = result;
    id v9 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLTileRenderPipelineDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__MTLToolsDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E12FB8;
  v8[4] = self;
  v8[5] = a4;
  [v7 newRenderPipelineStateWithTileDescriptor:v6 completionHandler:v8];
}

void __77__MTLToolsDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  if (a2) {
    a2 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 32)];
  }
  uint64_t v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = [(MTLToolsDevice *)self unwrapMTLTileRenderPipelineDescriptor:a3];
  id v9 = [(MTLToolsObject *)self baseObject];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__MTLToolsDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  v10[3] = &unk_264E12F90;
  v10[4] = self;
  v10[5] = a5;
  [v9 newRenderPipelineStateWithTileDescriptor:v8 options:a4 completionHandler:v10];
}

void __85__MTLToolsDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  if (a2) {
    a2 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 32)];
  }
  uint64_t v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithMeshDescriptor:error:", -[MTLToolsDevice unwrapMTLMeshRenderPipelineDescriptor:](self, "unwrapMTLMeshRenderPipelineDescriptor:", a3), a4);
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLMeshRenderPipelineDescriptor:](self, "unwrapMTLMeshRenderPipelineDescriptor:", a3), a4, a5, a6);
  if (result)
  {
    id v8 = result;
    id v9 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = [(MTLToolsDevice *)self unwrapMTLMeshRenderPipelineDescriptor:a3];
  id v9 = [(MTLToolsObject *)self baseObject];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__MTLToolsDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke;
  v10[3] = &unk_264E12F90;
  v10[4] = self;
  v10[5] = a5;
  [v9 newRenderPipelineStateWithMeshDescriptor:v8 options:a4 completionHandler:v10];
}

void __85__MTLToolsDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  if (a2) {
    a2 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 32)];
  }
  uint64_t v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLMeshRenderPipelineDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__MTLToolsDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E12FB8;
  v8[4] = self;
  v8[5] = a4;
  [v7 newRenderPipelineStateWithMeshDescriptor:v6 completionHandler:v8];
}

void __77__MTLToolsDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke(uint64_t a1, MTLToolsRenderPipelineState *a2)
{
  if (a2) {
    a2 = [[MTLToolsRenderPipelineState alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 32)];
  }
  uint64_t v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v7 = -[MTLToolsDevice newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:](self, "newLibraryWithImageFilterFunctionsSPI:imageFilterFunctionInfo:error:", a3, a4);
  id v8 = (void *)[v7 newFunctionWithName:@"ciKernelMain"];
  id v9 = [(MTLToolsDevice *)self newComputePipelineStateWithFunction:v8 error:a5];

  return v9;
}

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(a4);
        }
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13++), "baseObject"));
      }
      while (v11 != v13);
      uint64_t v11 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  long long v14 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithDAG:functions:error:", a3, v9, a5);

  if (!v14) {
    return 0;
  }
  long long v15 = [(MTLToolsObject *)[MTLToolsLibrary alloc] initWithBaseObject:v14 parent:self];

  return v15;
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLStitchedLibraryDescriptor:a3];
  id v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithStitchedDescriptor:error:", v6, a4);

  if (!v7) {
    return 0;
  }
  id v8 = [(MTLToolsObject *)[MTLToolsLibrary alloc] initWithBaseObject:v7 parent:self];

  return v8;
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLStitchedLibraryDescriptor:a3];
  id v7 = [(MTLToolsObject *)self baseObject];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__MTLToolsDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E13030;
  v8[4] = v6;
  v8[5] = self;
  void v8[6] = a4;
  [v7 newLibraryWithStitchedDescriptor:v6 completionHandler:v8];
}

void __69__MTLToolsDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v4 = [(MTLToolsObject *)[MTLToolsLibrary alloc] initWithBaseObject:a2 parent:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLStitchedLibraryDescriptor:a3];
  id v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLibraryWithStitchedDescriptorSPI:error:", v6, a4);

  if (!v7) {
    return 0;
  }
  id v8 = [(MTLToolsObject *)[MTLToolsLibrary alloc] initWithBaseObject:v7 parent:self];

  return v8;
}

- (id)newDagStringWithGraphs:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 newDagStringWithGraphs:a3];
}

- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13++), "baseObject"));
      }
      while (v11 != v13);
      uint64_t v11 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
  uint64_t v14 = objc_msgSend(-[MTLToolsObject originalObject](self, "originalObject"), "newLibraryWithCIFilters:imageFilterFunctionInfo:error:", v9, a4, a5);
  if (v14)
  {
    long long v15 = (void *)v14;
    long long v16 = [(MTLToolsObject *)[MTLToolsLibrary alloc] initWithBaseObject:v14 parent:self];
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = [(MTLToolsDevice *)self unwrapMTLCompileOptions:a4];
  id v9 = [(MTLToolsObject *)self baseObject];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__MTLToolsDevice_newLibraryWithSource_options_completionHandler___block_invoke;
  v10[3] = &unk_264E13058;
  v10[4] = self;
  v10[5] = a5;
  [v9 newLibraryWithSource:a3 options:v8 completionHandler:v10];
}

void __65__MTLToolsDevice_newLibraryWithSource_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__MTLToolsDevice_newLibraryWithSource_options_completionHandler___block_invoke_2;
  v6[3] = &unk_264E12F68;
  v6[4] = a2;
  v6[5] = v3;
  uint64_t v5 = (void *)[v4 getCachedObjectForKey:a2 onMiss:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__MTLToolsDevice_newLibraryWithSource_options_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MTLToolsLibrary alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return (uint64_t)[(MTLToolsObject *)v2 initWithBaseObject:v3 parent:v4];
}

- (BOOL)deviceSupportsFeatureSet:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 deviceSupportsFeatureSet:a3];
}

- (BOOL)deviceOrFeatureProfileSupportsFeatureSet:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 deviceOrFeatureProfileSupportsFeatureSet:a3];
}

- (BOOL)supportsFeatureSet:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 supportsFeatureSet:a3];
}

- (BOOL)supportsFamily:(int64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 supportsFamily:a3];
}

- (BOOL)supportsTextureSampleCount:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 supportsTextureSampleCount:a3];
}

- (BOOL)supportsSampleCount:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 supportsSampleCount:a3];
}

- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 minLinearTextureAlignmentForPixelFormat:a3];
}

- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 minimumLinearTextureAlignmentForPixelFormat:a3];
}

- (unint64_t)minimumTextureBufferAlignmentForPixelFormat:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 minimumTextureBufferAlignmentForPixelFormat:a3];
}

- (BOOL)areProgrammableSamplePositionsSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 areProgrammableSamplePositionsSupported];
}

- (void)getDefaultSamplePositions:(id *)a3 count:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 getDefaultSamplePositions:a3 count:a4];
}

- (BOOL)supportsRasterizationRateMapWithLayerCount:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 supportsRasterizationRateMapWithLayerCount:a3];
}

- (id)newRasterizationRateMapWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRasterizationRateMapWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLToolsRasterizationRateMap alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (unint64_t)maxRasterizationRateLayerCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxRasterizationRateLayerCount];
}

- (void)_setDeviceWrapper:(id)a3
{
}

- (id)_deviceWrapper
{
  p_deviceWrapper = &self->_deviceWrapper;
  if (!objc_loadWeak((id *)&self->_deviceWrapper)) {
    return self;
  }
  id Weak = objc_loadWeak((id *)p_deviceWrapper);

  return (id)[Weak _deviceWrapper];
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithIOSurface:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsResource *)[MTLToolsBuffer alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (unint64_t)resourcePatchingTypeForResourceType:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 resourcePatchingTypeForResourceType:a3];
}

- (void)reserveResourceIndicesForResourceType:(unint64_t)a3 indices:(unint64_t *)a4 indexCount:(unint64_t)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];

  [v8 reserveResourceIndicesForResourceType:a3 indices:a4 indexCount:a5];
}

- (unint64_t)halfFPConfig
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 halfFPConfig];
}

- (unint64_t)singleFPConfig
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 singleFPConfig];
}

- (unint64_t)doubleFPConfig
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 doubleFPConfig];
}

- (unint64_t)featureProfile
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 featureProfile];
}

- (const)limits
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (const $8F4FC51FDE2459731A28129D66393995 *)[v2 limits];
}

- (unsigned)acceleratorPort
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 acceleratorPort];
}

- (BOOL)supportPriorityBand
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportPriorityBand];
}

- (unint64_t)maxFramebufferStorageBits
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxFramebufferStorageBits];
}

- (unint64_t)linearTextureArrayAlignmentBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 linearTextureArrayAlignmentBytes];
}

- (unint64_t)linearTextureArrayAlignmentSlice
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 linearTextureArrayAlignmentSlice];
}

- (unint64_t)maxTileBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTileBuffers];
}

- (unint64_t)maxTileTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTileTextures];
}

- (unint64_t)maxTileSamplers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTileSamplers];
}

- (unint64_t)maxTileInlineDataSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTileInlineDataSize];
}

- (unint64_t)minTilePixels
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 minTilePixels];
}

- (unint64_t)maxColorAttachments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxColorAttachments];
}

- (unint64_t)maxVertexAttributes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxVertexAttributes];
}

- (unint64_t)maxVertexBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxVertexBuffers];
}

- (unint64_t)maxVertexTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxVertexTextures];
}

- (unint64_t)maxVertexSamplers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxVertexSamplers];
}

- (unint64_t)maxVertexInlineDataSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxVertexInlineDataSize];
}

- (unint64_t)maxInterpolants
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxInterpolants];
}

- (unint64_t)maxFragmentBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxFragmentBuffers];
}

- (unint64_t)maxFragmentTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxFragmentTextures];
}

- (unint64_t)maxFragmentSamplers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxFragmentSamplers];
}

- (unint64_t)maxFragmentInlineDataSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxFragmentInlineDataSize];
}

- (unint64_t)maxComputeBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxComputeBuffers];
}

- (unint64_t)maxComputeTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxComputeTextures];
}

- (unint64_t)maxComputeSamplers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxComputeSamplers];
}

- (unint64_t)maxComputeInlineDataSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxComputeInlineDataSize];
}

- (unint64_t)maxComputeLocalMemorySizes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxComputeLocalMemorySizes];
}

- (unint64_t)maxTotalComputeThreadsPerThreadgroup
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTotalComputeThreadsPerThreadgroup];
}

- (unint64_t)maxComputeThreadgroupMemory
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxComputeThreadgroupMemory];
}

- (float)maxLineWidth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 maxLineWidth];
  return result;
}

- (float)maxPointSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 maxPointSize];
  return result;
}

- (unint64_t)maxVisibilityQueryOffset
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxVisibilityQueryOffset];
}

- (unint64_t)minConstantBufferAlignmentBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 minConstantBufferAlignmentBytes];
}

- (unint64_t)minBufferNoCopyAlignmentBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 minBufferNoCopyAlignmentBytes];
}

- (unint64_t)maxTextureWidth1D
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTextureWidth1D];
}

- (unint64_t)maxTextureWidth2D
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTextureWidth2D];
}

- (unint64_t)maxTextureHeight2D
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTextureHeight2D];
}

- (unint64_t)maxTextureWidth3D
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTextureWidth3D];
}

- (unint64_t)maxTextureHeight3D
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTextureHeight3D];
}

- (unint64_t)maxTextureDepth3D
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTextureDepth3D];
}

- (unint64_t)maxTextureDimensionCube
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTextureDimensionCube];
}

- (unint64_t)maxTextureLayers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTextureLayers];
}

- (unint64_t)linearTextureAlignmentBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 linearTextureAlignmentBytes];
}

- (unint64_t)iosurfaceTextureAlignmentBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 iosurfaceTextureAlignmentBytes];
}

- (unint64_t)iosurfaceReadOnlyTextureAlignmentBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 iosurfaceReadOnlyTextureAlignmentBytes];
}

- (unint64_t)deviceLinearTextureAlignmentBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 deviceLinearTextureAlignmentBytes];
}

- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 deviceLinearReadOnlyTextureAlignmentBytes];
}

- (unint64_t)maxFunctionConstantIndices
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxFunctionConstantIndices];
}

- (unint64_t)maxComputeThreadgroupMemoryAlignmentBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxComputeThreadgroupMemoryAlignmentBytes];
}

- (unint64_t)maxInterpolatedComponents
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxInterpolatedComponents];
}

- (unint64_t)maxTessellationFactor
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTessellationFactor];
}

- (unint64_t)maxIndirectBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxIndirectBuffers];
}

- (unint64_t)maxIndirectTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxIndirectTextures];
}

- (unint64_t)maxIndirectSamplers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxIndirectSamplers];
}

- (unint64_t)maxIndirectSamplersPerDevice
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxIndirectSamplersPerDevice];
}

- (unint64_t)maxFenceInstances
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxFenceInstances];
}

- (unint64_t)maxViewportCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxViewportCount];
}

- (unint64_t)maxCustomSamplePositions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxCustomSamplePositions];
}

- (unint64_t)maxVertexAmplificationFactor
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxVertexAmplificationFactor];
}

- (unint64_t)maxVertexAmplificationCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxVertexAmplificationCount];
}

- (unint64_t)maxTextureBufferWidth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxTextureBufferWidth];
}

- (unint64_t)maxComputeAttributes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxComputeAttributes];
}

- (unint64_t)maxIOCommandsInFlight
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxIOCommandsInFlight];
}

- (unint64_t)maxPredicatedNestingDepth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxPredicatedNestingDepth];
}

- (unint64_t)maxAccelerationStructureLevels
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxAccelerationStructureLevels];
}

- (unint64_t)maxConstantBufferArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxConstantBufferArguments];
}

- (unint64_t)maxBufferLength
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxBufferLength];
}

- (unint64_t)readWriteTextureSupport
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 readWriteTextureSupport];
}

- (unint64_t)argumentBuffersSupport
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 argumentBuffersSupport];
}

- (BOOL)areRasterOrderGroupsSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 areRasterOrderGroupsSupported];
}

- (BOOL)isFloat32FilteringSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isFloat32FilteringSupported];
}

- (BOOL)isBCTextureCompressionSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isBCTextureCompressionSupported];
}

- (BOOL)isMsaa32bSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isMsaa32bSupported];
}

- (BOOL)isRGB10A2GammaSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isRGB10A2GammaSupported];
}

- (BOOL)isCustomBorderColorSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isCustomBorderColorSupported];
}

- (BOOL)isClampToHalfBorderSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isClampToHalfBorderSupported];
}

- (BOOL)areBarycentricCoordsSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsShaderBarycentricCoordinates];
}

- (BOOL)isLargeMRTSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isLargeMRTSupported];
}

- (BOOL)isQuadDataSharingSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isQuadDataSharingSupported];
}

- (BOOL)isFixedLinePointFillDepthGradientSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isFixedLinePointFillDepthGradientSupported];
}

- (unint64_t)sparseTexturesSupport
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 sparseTexturesSupport];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)tileSizeWithSparsePageSize:(SEL)a3 textureType:(int64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6
{
  float result = [(MTLToolsObject *)self baseObject];
  if (result)
  {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result tileSizeWithSparsePageSize:a4 textureType:a5 pixelFormat:a6 sampleCount:a7];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5
{
  float result = [(MTLToolsObject *)self baseObject];
  if (result)
  {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result sparseTileSizeWithTextureType:a4 pixelFormat:a5 sampleCount:a6];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5 sparsePageSize:(unint64_t)a6
{
  float result = [(MTLToolsObject *)self baseObject];
  if (result)
  {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result sparseTileSizeWithTextureType:a4 pixelFormat:a5 sampleCount:a6 sparsePageSize:a7];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- (unsigned)maximumComputeSubstreams
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maximumComputeSubstreams];
}

- (id)newResourceGroupFromResources:(const void *)a3 count:(unint64_t)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = (char *)v15 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    id v7 = a3;
    unint64_t v8 = a4;
    id v9 = (void *)((char *)v15 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      uint64_t v10 = (void *)*v7++;
      *v9++ = [v10 baseObject];
      --v8;
    }
    while (v8);
  }
  uint64_t v11 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "newResourceGroupFromResources:count:", v6, a4);
  if (!v11) {
    return 0;
  }
  uint64_t v12 = (void *)v11;
  uint64_t v13 = [(MTLToolsObject *)[MTLToolsResourceGroupSPI alloc] initWithBaseObject:v11 parent:self];

  return v13;
}

- (BOOL)metalAssertionsEnabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 metalAssertionsEnabled];
}

- (void)setMetalAssertionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setMetalAssertionsEnabled:v3];
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:iosurface:plane:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    unint64_t v8 = [(MTLToolsResource *)[MTLToolsTexture alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (id)newEvent
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newEvent");
  if (result)
  {
    id v4 = result;
    id v5 = [(MTLToolsObject *)[MTLToolsEvent alloc] initWithBaseObject:result parent:self];

    return v5;
  }
  return result;
}

- (id)newEventWithOptions:(int64_t)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newEventWithOptions:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLToolsEvent alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newSharedEvent
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEvent");
  if (result)
  {
    id v3 = result;
    id v4 = [(MTLToolsObject *)[MTLToolsSharedEvent alloc] initWithBaseObject:result parent:0];

    return v4;
  }
  return result;
}

- (id)newSharedEventWithOptions:(int64_t)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventWithOptions:", a3);
  if (result)
  {
    id v4 = result;
    id v5 = [(MTLToolsObject *)[MTLToolsSharedEvent alloc] initWithBaseObject:result parent:0];

    return v5;
  }
  return result;
}

- (id)newSharedEventWithMachPort:(unsigned int)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventWithMachPort:", *(void *)&a3);
  if (result)
  {
    id v4 = result;
    id v5 = [(MTLToolsObject *)[MTLToolsSharedEvent alloc] initWithBaseObject:result parent:0];

    return v5;
  }
  return result;
}

- (id)newSharedEventWithHandle:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSharedEventWithHandle:", a3);
  if (result)
  {
    id v4 = result;
    id v5 = [(MTLToolsObject *)[MTLToolsSharedEvent alloc] initWithBaseObject:result parent:0];

    return v5;
  }
  return result;
}

- (id)newLateEvalEvent
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newLateEvalEvent");
  if (result)
  {
    id v4 = result;
    id v5 = [(MTLToolsObject *)[MTLToolsLateEvalEvent alloc] initWithBaseObject:result parent:self];

    return v5;
  }
  return result;
}

- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureLayoutWithDescriptor:isHeapOrBufferBacked:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsTextureLayout alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (void)setupMPSFunctionTable:(MPSFunctionTable *)a3
{
  [(MTLToolsObject *)self originalObject];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(MTLToolsObject *)self originalObject];
    [v5 setupMPSFunctionTable:a3];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_newBufferWithIOSurface_ == a3)
  {
    [(MTLToolsObject *)self baseObject];
    unsigned __int8 v3 = objc_opt_respondsToSelector();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLToolsDevice;
    unsigned __int8 v3 = [(MTLToolsDevice *)&v5 respondsToSelector:a3];
  }
  return v3 & 1;
}

- (unint64_t)currentAllocatedSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 currentAllocatedSize];
}

- (void)allowLibrariesFromOtherPlatforms
{
  id v2 = [(MTLToolsObject *)self baseObject];

  [v2 allowLibrariesFromOtherPlatforms];
}

- (unint64_t)sparseTileSizeInBytes
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 sparseTileSizeInBytes];
}

- (unint64_t)sparseTileSizeInBytesForSparsePageSize:(int64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 sparseTileSizeInBytesForSparsePageSize:a3];
}

- (void)convertSparsePixelRegions:(id *)a3 toTileRegions:(id *)a4 withTileSize:(id *)a5 alignmentMode:(unint64_t)a6 numRegions:(unint64_t)a7
{
  id v12 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13 = *a5;
  [v12 convertSparsePixelRegions:a3 toTileRegions:a4 withTileSize:&v13 alignmentMode:a6 numRegions:a7];
}

- (void)convertSparseTileRegions:(id *)a3 toPixelRegions:(id *)a4 withTileSize:(id *)a5 numRegions:(unint64_t)a6
{
  id v10 = [(MTLToolsObject *)self baseObject];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a5;
  [v10 convertSparseTileRegions:a3 toPixelRegions:a4 withTileSize:&v11 numRegions:a6];
}

- (NSArray)counterSets
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSArray *)[v2 counterSets];
}

- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  [v6 sampleTimestamps:a3 gpuTimestamp:a4];
}

- (BOOL)supportsCounterSampling:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 supportsCounterSampling:a3];
}

- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCounterSampleBufferWithDescriptor:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsCounterSampleBuffer alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (BOOL)isPlacementHeapSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isPlacementHeapSupported];
}

- (unint64_t)commandBufferErrorOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 commandBufferErrorOptions];
}

- (void)setCommandBufferErrorOptions:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setCommandBufferErrorOptions:a3];
}

- (unint64_t)getSupportedCommandBufferErrorOptions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 getSupportedCommandBufferErrorOptions];
}

- (BOOL)supportsPrimitiveType:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 supportsPrimitiveType:a3];
}

- (unint64_t)deviceCreationFlags
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 deviceCreationFlags];
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryArchiveWithDescriptor:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [(MTLToolsObject *)[MTLToolsBinaryArchive alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryLibraryWithOptions:url:error:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    unint64_t v8 = [(MTLToolsObject *)[MTLToolsBinaryArchive alloc] initWithBaseObject:result parent:self];

    return v8;
  }
  return result;
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  objc_super v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibraryWithURL:error:", a3, a4);
  id v6 = [(MTLToolsDevice *)self getDynamicLibraryForBaseObject:v5];

  return v6;
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibraryWithURL:options:error:", a3, a4, a5);
  id v7 = [(MTLToolsDevice *)self getDynamicLibraryForBaseObject:v6];

  return v7;
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  objc_super v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibrary:error:", objc_msgSend(a3, "baseObject"), a4);
  id v6 = [(MTLToolsDevice *)self getDynamicLibraryForBaseObject:v5];

  return v6;
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  id v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibrary:computeDescriptor:error:", objc_msgSend(a3, "baseObject"), -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:", a4), a5);
  id v7 = [(MTLToolsDevice *)self getDynamicLibraryForBaseObject:v6];

  return v7;
}

- (BOOL)validateDynamicLibraryDescriptor:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLDynamicLibraryDescriptorSPI:a3];
  LOBYTE(a4) = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "validateDynamicLibraryDescriptor:error:", v6, a4);

  return (char)a4;
}

- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = [(MTLToolsDevice *)self unwrapMTLDynamicLibraryDescriptorSPI:a3];
  id v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDynamicLibraryWithDescriptor:error:", v6, a4);

  return v7;
}

- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 supportsVertexAmplificationCount:a3];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  id result = [(MTLToolsObject *)self baseObject];
  if (result)
  {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result accelerationStructureSizesWithDescriptor:a4];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  id v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:", a3);
  objc_super v5 = [[MTLToolsAccelerationStructure alloc] initWithBaseObject:v4 parent:self];

  return v5;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  id v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithDescriptor:", a3);
  objc_super v5 = [[MTLToolsAccelerationStructure alloc] initWithBaseObject:v4 parent:self];

  return v5;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  objc_super v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:resourceIndex:", a3, a4);
  id v6 = [[MTLToolsAccelerationStructure alloc] initWithBaseObject:v5 parent:self];

  return v6;
}

- (BOOL)isCompatibleWithAccelerationStructure:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 isCompatibleWithAccelerationStructure:a3];
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  objc_super v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithBuffer:offset:", objc_msgSend(a3, "baseObject"), a4);
  id v6 = [[MTLToolsAccelerationStructure alloc] initWithBaseObject:v5 parent:self];

  return v6;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  id v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithBuffer:offset:resourceIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  id v7 = [[MTLToolsAccelerationStructure alloc] initWithBaseObject:v6 parent:self];

  return v7;
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializePrimitiveAccelerationStructureFromBytes:withDescriptor:", a3, unwrapAccelerationStructureDescriptor(a4));
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLToolsAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a4, "count"));
  if ([a4 count])
  {
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      objc_msgSend(v9, "addObject:", objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v10), "baseObject"));
      uint64_t v10 = v11;
    }
    while ([a4 count] > (unint64_t)v11++);
  }
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "deserializeInstanceAccelerationStructureFromBytes:primitiveAccelerationStructures:withDescriptor:", a3, v9, unwrapAccelerationStructureDescriptor(a5));
  if (result)
  {
    id v14 = result;
    long long v15 = [[MTLToolsAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v15;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newAccelerationStructureWithSize:withDescriptor:", a3, a4);
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLToolsAccelerationStructure alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5
{
  id v8 = [(MTLToolsObject *)self baseObject];
  uint64_t v9 = [a3 baseObject];
  id v10 = unwrapAccelerationStructureDescriptor(a5);

  [v8 deserializePrimitiveAccelerationStructure:v9 fromBytes:a4 withDescriptor:v10];
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6
{
  unsigned int v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a5, "count"));
  if ([a5 count])
  {
    uint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      objc_msgSend(v11, "addObject:", objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v12), "baseObject"));
      uint64_t v12 = v13;
    }
    while ([a5 count] > (unint64_t)v13++);
  }
  id v15 = [(MTLToolsObject *)self baseObject];
  uint64_t v16 = [a3 baseObject];
  id v17 = unwrapAccelerationStructureDescriptor(a6);

  [v15 deserializeInstanceAccelerationStructure:v16 fromBytes:a4 primitiveAccelerationStructures:v11 withDescriptor:v17];
}

- (BOOL)isRTZRoundingSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isRTZRoundingSupported];
}

- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 supportsTextureWriteRoundingMode:a3];
}

- (int64_t)defaultTextureWriteRoundingMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 defaultTextureWriteRoundingMode];
}

- (BOOL)isAnisoSampleFixSupported
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 isAnisoSampleFixSupported];
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsResource *)[MTLToolsVisibleFunctionTable alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsResource *)[MTLToolsIntersectionFunctionTable alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newProfileWithExecutionSize:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newProfileWithExecutionSize:", a3);
  if (result)
  {
    id v5 = result;
    id v6 = [(MTLToolsObject *)[MTLToolsDeadlineProfile alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)unwrapMTLCommandBufferDescriptor:(id)a3 alwaysCopy:(BOOL)a4
{
  BOOL v4 = a4;
  if (![a3 deadlineProfile] && !v4) {
    return a3;
  }
  id v7 = (void *)[a3 copy];
  id v8 = (void *)[a3 copy];
  uint64_t v9 = (void *)[v8 deadlineProfile];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = (objc_class *)objc_opt_class();
      unsigned int v11 = [NSStringFromClass(v10) UTF8String];
      uint64_t v12 = (objc_class *)objc_opt_class();
      id v14 = v11;
      id v15 = [NSStringFromClass(v12) UTF8String];
      unsigned int v13 = "-[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:]";
      MTLReportFailure();
    }
  }
  objc_msgSend(v8, "setDeadlineProfile:", objc_msgSend(v9, "baseObject", v13, v14, v15));

  return v7;
}

- (BOOL)supportsBufferlessClientStorageTexture
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBufferlessClientStorageTexture];
}

- (BOOL)supportsComputeMemoryBarrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsComputeMemoryBarrier];
}

- (BOOL)supportsRenderMemoryBarrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRenderMemoryBarrier];
}

- (BOOL)supportsPartialRenderMemoryBarrier
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPartialRenderMemoryBarrier];
}

- (BOOL)supportsArgumentBuffersTier2
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsArgumentBuffersTier2];
}

- (BOOL)supportsReadWriteTextureArgumentsTier2
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsReadWriteTextureArgumentsTier2];
}

- (BOOL)supportsStreamingCodecSignaling
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsStreamingCodecSignaling];
}

- (BOOL)supportsProgrammableSamplePositions
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsProgrammableSamplePositions];
}

- (BOOL)supportsLargeFramebufferConfigs
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsLargeFramebufferConfigs];
}

- (BOOL)supportsCustomBorderColor
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsCustomBorderColor];
}

- (BOOL)supportsSamplerAddressModeClampToHalfBorder
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSamplerAddressModeClampToHalfBorder];
}

- (BOOL)supportsBCTextureCompression
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBCTextureCompression];
}

- (BOOL)supports3DBCTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supports3DBCTextures];
}

- (BOOL)supportsRGBA10A2Gamma
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRGBA10A2Gamma];
}

- (BOOL)supportsBGR10A2
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBGR10A2];
}

- (BOOL)supportsPrimitiveRestartOverride
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPrimitiveRestartOverride];
}

- (BOOL)supportsGlobalVariableRelocation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsGlobalVariableRelocation];
}

- (BOOL)supportsGlobalVariableRelocationRender
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsGlobalVariableRelocationRender];
}

- (BOOL)supportsGlobalVariableRelocationCompute
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsGlobalVariableRelocationCompute];
}

- (BOOL)supportsTLS
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsTLS];
}

- (BOOL)supportsGlobalVariableBindings
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsGlobalVariableBindings];
}

- (BOOL)supportsGlobalVariableBindingInDylibs
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsGlobalVariableBindingInDylibs];
}

- (BOOL)supports32bpcMSAATextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supports32bpcMSAATextures];
}

- (BOOL)supports32BitMSAA
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supports32BitMSAA];
}

- (BOOL)supports32BitFloatFiltering
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supports32BitFloatFiltering];
}

- (BOOL)supportsQueryTextureLOD
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsQueryTextureLOD];
}

- (BOOL)supportsVertexAmplification
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsVertexAmplification];
}

- (BOOL)supportsPlacementHeaps
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPlacementHeaps];
}

- (BOOL)supportsOpenCLTextureWriteSwizzles
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsOpenCLTextureWriteSwizzles];
}

- (BOOL)supportsPullModelInterpolation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPullModelInterpolation];
}

- (BOOL)supportsInt64
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsInt64];
}

- (BOOL)supportsFixedLinePointFillDepthGradient
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFixedLinePointFillDepthGradient];
}

- (BOOL)supportsLateEvalEvent
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsLateEvalEvent];
}

- (BOOL)supportsNonZeroTextureWriteLOD
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsNonZeroTextureWriteLOD];
}

- (BOOL)supportsSharedTextureHandles
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSharedTextureHandles];
}

- (BOOL)supportsBufferPrefetchStatistics
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBufferPrefetchStatistics];
}

- (BOOL)supportsLimitedYUVFormats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsLimitedYUVFormats];
}

- (BOOL)supportsNonPrivateDepthStencilTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsNonPrivateDepthStencilTextures];
}

- (BOOL)supportsNonPrivateMSAATextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsNonPrivateMSAATextures];
}

- (BOOL)supportsSharedStorageHeapResources
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSharedStorageHeapResources];
}

- (BOOL)supportsSharedStorageTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSharedStorageTextures];
}

- (BOOL)supportsLinearTextureFromSharedBuffer
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsLinearTextureFromSharedBuffer];
}

- (BOOL)supportsPipelineLibraries
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPipelineLibraries];
}

- (BOOL)supportsFragmentOnlyEncoders
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFragmentOnlyEncoders];
}

- (BOOL)supportsBufferWithIOSurface
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBufferWithIOSurface];
}

- (BOOL)supportsProgrammableBlending
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsProgrammableBlending];
}

- (BOOL)supportsRenderToLinearTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRenderToLinearTextures];
}

- (BOOL)supportsMemorylessRenderTargets
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMemorylessRenderTargets];
}

- (BOOL)supportsFastMathInfNaNPropagation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFastMathInfNaNPropagation];
}

- (BOOL)supportsInvariantVertexPosition
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsInvariantVertexPosition];
}

- (BOOL)supportsShaderLODAverage
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsShaderLODAverage];
}

- (BOOL)supportsRelaxedTextureViewRequirements
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRelaxedTextureViewRequirements];
}

- (BOOL)supportsSeparateDepthStencil
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSeparateDepthStencil];
}

- (BOOL)supportsGPUStatistics
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsGPUStatistics];
}

- (BOOL)supportsCompressedTextureViewSPI
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsCompressedTextureViewSPI];
}

- (BOOL)supportsRenderTargetTextureRotation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRenderTargetTextureRotation];
}

- (BOOL)supportsDynamicControlPointCount
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsDynamicControlPointCount];
}

- (BOOL)supportsIABHashForTools
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsIABHashForTools];
}

- (BOOL)supportsBinaryArchives
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBinaryArchives];
}

- (BOOL)supportsBinaryLibraries
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBinaryLibraries];
}

- (BOOL)supportsDeadlineProfile
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsDeadlineProfile];
}

- (BOOL)supportsFillTexture
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFillTexture];
}

- (BOOL)supportsSetThreadgroupPackingDisabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSetThreadgroupPackingDisabled];
}

- (BOOL)supportsASTCTextureCompression
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsASTCTextureCompression];
}

- (BOOL)supportsExtendedYUVFormats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsExtendedYUVFormats];
}

- (BOOL)supportsPublicXR10Formats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPublicXR10Formats];
}

- (BOOL)supportsSRGBwrites
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSRGBwrites];
}

- (BOOL)supportsDepthClipMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsDepthClipMode];
}

- (BOOL)supportsResourceHeaps
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsResourceHeaps];
}

- (BOOL)supportsArgumentBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsArgumentBuffers];
}

- (BOOL)supportsPacked32TextureBufferWrites
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPacked32TextureBufferWrites];
}

- (BOOL)supports3DASTCTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supports3DASTCTextures];
}

- (BOOL)supportsExtendedXR10Formats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsExtendedXR10Formats];
}

- (BOOL)supportsFragmentBufferWrites
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFragmentBufferWrites];
}

- (BOOL)supportsCountingOcclusionQuery
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsCountingOcclusionQuery];
}

- (BOOL)supportsBaseVertexInstanceDrawing
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBaseVertexInstanceDrawing];
}

- (BOOL)supportsIndirectDrawAndDispatch
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsIndirectDrawAndDispatch];
}

- (BOOL)supportsTessellation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsTessellation];
}

- (BOOL)supportsReadWriteBufferArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsReadWriteBufferArguments];
}

- (BOOL)supportsArrayOfTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsArrayOfTextures];
}

- (BOOL)supportsArrayOfSamplers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsArrayOfSamplers];
}

- (BOOL)supportsCombinedMSAAStoreAndResolveAction
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsCombinedMSAAStoreAndResolveAction];
}

- (BOOL)supportsMutableTier1ArgumentBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMutableTier1ArgumentBuffers];
}

- (BOOL)supportsSamplerCompareFunction
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSamplerCompareFunction];
}

- (BOOL)supportsMSAADepthResolve
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMSAADepthResolve];
}

- (BOOL)supportsMSAAStencilResolve
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMSAAStencilResolve];
}

- (BOOL)supportsMSAADepthResolveFilter
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMSAADepthResolveFilter];
}

- (BOOL)supportsGFXIndirectCommandBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsGFXIndirectCommandBuffers];
}

- (BOOL)supportsCMPIndirectCommandBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsCMPIndirectCommandBuffers];
}

- (BOOL)supportsIndirectStageInRegion
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsIndirectStageInRegion];
}

- (BOOL)supportsIndirectTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsIndirectTextures];
}

- (BOOL)supportsNorm16BCubicFiltering
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsNorm16BCubicFiltering];
}

- (BOOL)supportsTextureOutOfBoundsReads
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsTextureOutOfBoundsReads];
}

- (BOOL)supportsTextureSwizzle
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsTextureSwizzle];
}

- (BOOL)supportsAlphaYUVFormats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsAlphaYUVFormats];
}

- (BOOL)supportsMemoryOrderAtomics
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMemoryOrderAtomics];
}

- (BOOL)supportsQuadGroup
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsQuadGroup];
}

- (BOOL)supportsRenderTextureWrites
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRenderTextureWrites];
}

- (BOOL)supportsImageBlocks
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsImageBlocks];
}

- (BOOL)supportsTileShaders
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsTileShaders];
}

- (BOOL)supportsImageBlockSampleCoverageControl
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsImageBlockSampleCoverageControl];
}

- (BOOL)supportsNativeHardwareFP16
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsNativeHardwareFP16];
}

- (BOOL)supportsPostDepthCoverage
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPostDepthCoverage];
}

- (BOOL)supportsMipLevelsSmallerThanBlockSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMipLevelsSmallerThanBlockSize];
}

- (BOOL)supportsNonUniformThreadgroupSize
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsNonUniformThreadgroupSize];
}

- (BOOL)supportsReadWriteTextureArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsReadWriteTextureArguments];
}

- (BOOL)supportsReadWriteTextureCubeArguments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsReadWriteTextureCubeArguments];
}

- (BOOL)supportsTextureCubeArray
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsTextureCubeArray];
}

- (BOOL)supportsQuadShufflesAndBroadcast
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsQuadShufflesAndBroadcast];
}

- (BOOL)supportsConcurrentComputeDispatch
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsConcurrentComputeDispatch];
}

- (BOOL)supportsRenderPassWithoutRenderTarget
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRenderPassWithoutRenderTarget];
}

- (BOOL)supportsRasterOrderGroups
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRasterOrderGroups];
}

- (BOOL)supportsRasterOrderGroupsColorAttachment
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRasterOrderGroupsColorAttachment];
}

- (BOOL)supportsDynamicAttributeStride
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsDynamicAttributeStride];
}

- (BOOL)supportsLinearTexture2DArray
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsLinearTexture2DArray];
}

- (BOOL)supportsNonSquareTileShaders
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsNonSquareTileShaders];
}

- (BOOL)supportsSeparateVisibilityAndShadingRate
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSeparateVisibilityAndShadingRate];
}

- (BOOL)supports2DLinearTexArraySPI
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supports2DLinearTexArraySPI];
}

- (BOOL)supportsLayeredRendering
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsLayeredRendering];
}

- (BOOL)supportsViewportAndScissorArray
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsViewportAndScissorArray];
}

- (BOOL)supportsIndirectTessellation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsIndirectTessellation];
}

- (BOOL)supportsMSAAStencilResolveFilter
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMSAAStencilResolveFilter];
}

- (BOOL)supportsStencilFeedback
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsStencilFeedback];
}

- (BOOL)supportsFP32TessFactors
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFP32TessFactors];
}

- (BOOL)supportsUnalignedVertexFetch
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsUnalignedVertexFetch];
}

- (BOOL)supportsExtendedVertexFormats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsExtendedVertexFormats];
}

- (BOOL)supportsResourceDetachBacking
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsResourceDetachBacking];
}

- (BOOL)supportsBufferWithAddressRanges
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBufferWithAddressRanges];
}

- (BOOL)supportsHeapWithAddressRanges
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsHeapWithAddressRanges];
}

- (BOOL)supportsSIMDGroup
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSIMDGroup];
}

- (BOOL)supportsShaderMinLODClamp
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsShaderMinLODClamp];
}

- (BOOL)supportsSIMDShufflesAndBroadcast
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSIMDShufflesAndBroadcast];
}

- (BOOL)supportsWritableArrayOfTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsWritableArrayOfTextures];
}

- (BOOL)supportsVariableRateRasterization
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsVariableRateRasterization];
}

- (BOOL)supportsYCBCRFormats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsYCBCRFormats];
}

- (BOOL)supportsYCBCRFormatsPQ
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsYCBCRFormatsPQ];
}

- (BOOL)supportsYCBCRFormats12
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsYCBCRFormats12];
}

- (BOOL)supportsYCBCRFormatsXR
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsYCBCRFormatsXR];
}

- (BOOL)supportsASTCHDRTextureCompression
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsASTCHDRTextureCompression];
}

- (BOOL)supportsSparseTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSparseTextures];
}

- (BOOL)supportsSparseHeaps
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSparseHeaps];
}

- (BOOL)supportsIndirectWritableTextures
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsIndirectWritableTextures];
}

- (BOOL)supportsFunctionPointers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFunctionPointers];
}

- (BOOL)supportsDynamicLibraries
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsDynamicLibraries];
}

- (BOOL)supportsStatefulDynamicLibraries
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsStatefulDynamicLibraries];
}

- (BOOL)supportsRenderDynamicLibraries
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRenderDynamicLibraries];
}

- (BOOL)supportsFunctionPointersFromRender
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFunctionPointersFromRender];
}

- (BOOL)supportsSharedFunctionTables
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSharedFunctionTables];
}

- (BOOL)supportsRaytracingFromRender
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRaytracingFromRender];
}

- (BOOL)supportsPrimitiveMotionBlur
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPrimitiveMotionBlur];
}

- (BOOL)supportsRayTracingExtendedVertexFormats
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingExtendedVertexFormats];
}

- (BOOL)supportsHeapAccelerationStructureAllocation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsHeapAccelerationStructureAllocation];
}

- (BOOL)supportsRayTracingPerPrimitiveData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingPerPrimitiveData];
}

- (BOOL)supportsRayTracingTraversalMetrics
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingTraversalMetrics];
}

- (BOOL)supportsRayTracingBuffersFromTables
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingBuffersFromTables];
}

- (BOOL)supportsRayTracingAccelerationStructureCPUDeserialization
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingAccelerationStructureCPUDeserialization];
}

- (BOOL)supportsRayTracingMultiLevelInstancing
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingMultiLevelInstancing];
}

- (BOOL)supportsRayTracingIndirectInstanceAccelerationStructureBuild
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingIndirectInstanceAccelerationStructureBuild];
}

- (BOOL)supportsRayTracingGPUTableUpdateBuffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingGPUTableUpdateBuffers];
}

- (BOOL)supportsRayTracingCurves
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingCurves];
}

- (BOOL)supportsShaderBarycentricCoordinates
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsShaderBarycentricCoordinates];
}

- (BOOL)supportsBlackOrWhiteSamplerBorderColors
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBlackOrWhiteSamplerBorderColors];
}

- (BOOL)supportsMirrorClampToEdgeSamplerMode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMirrorClampToEdgeSamplerMode];
}

- (BOOL)supportsSIMDReduction
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSIMDReduction];
}

- (BOOL)supportsDepthClipModeClampExtended
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsDepthClipModeClampExtended];
}

- (BOOL)supportsTexture2DMultisampleArray
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsTexture2DMultisampleArray];
}

- (BOOL)supportsForceSeamsOnCubemaps
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsForceSeamsOnCubemaps];
}

- (BOOL)supportsFloat16BCubicFiltering
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFloat16BCubicFiltering];
}

- (BOOL)supportsFloat16InfNanFiltering
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFloat16InfNanFiltering];
}

- (BOOL)supportsRTZRounding
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRTZRounding];
}

- (BOOL)supportsAnisoSampleFix
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsAnisoSampleFix];
}

- (BOOL)supportsYCBCRPackedFormatsPQ
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsYCBCRPackedFormatsPQ];
}

- (BOOL)supportsYCBCRPackedFormats12
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsYCBCRPackedFormats12];
}

- (BOOL)supportsYCBCRPackedFormatsXR
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsYCBCRPackedFormatsXR];
}

- (BOOL)supportsBufferBoundsChecking
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBufferBoundsChecking];
}

- (BOOL)supportsForkJoin
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsForkJoin];
}

- (BOOL)supportsDevicePartitioning
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsDevicePartitioning];
}

- (BOOL)supportsComputeCompressedTextureWrite
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsComputeCompressedTextureWrite];
}

- (BOOL)supportsSIMDGroupMatrix
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSIMDGroupMatrix];
}

- (BOOL)supportsInterchangeTiled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsInterchangeTiled];
}

- (BOOL)supportsQuadReduction
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsQuadReduction];
}

- (BOOL)supportsVirtualSubstreams
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsVirtualSubstreams];
}

- (BOOL)supportsSIMDShuffleAndFill
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSIMDShuffleAndFill];
}

- (BOOL)supportsBfloat16Format
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBfloat16Format];
}

- (BOOL)supportsSparseDepthAttachments
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsSparseDepthAttachments];
}

- (BOOL)supportsAtomicUlongVoidMinMax
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsAtomicUlongVoidMinMax];
}

- (BOOL)supportsLossyCompression
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsLossyCompression];
}

- (BOOL)supportsMeshShaders
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMeshShaders];
}

- (BOOL)supportsFunctionPointersFromMesh
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsFunctionPointersFromMesh];
}

- (BOOL)supportsMeshShadersInICB
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMeshShadersInICB];
}

- (BOOL)supportsMeshRenderDynamicLibraries
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsMeshRenderDynamicLibraries];
}

- (BOOL)supportsBfloat16Buffers
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsBfloat16Buffers];
}

- (BOOL)supportsCommandBufferJump
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsCommandBufferJump];
}

- (BOOL)supportsColorSpaceConversionMatrixSelection
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsColorSpaceConversionMatrixSelection];
}

- (BOOL)supportsPerPlaneCompression
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPerPlaneCompression];
}

- (BOOL)supportsConditionalLoadStore
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsConditionalLoadStore];
}

- (BOOL)supportsStackOverflowErrorCode
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsStackOverflowErrorCode];
}

- (BOOL)supportsRayTracingICBs
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingICBs];
}

- (BOOL)supportsPerformanceStateAssertion
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsPerformanceStateAssertion];
}

- (BOOL)supportsExplicitVisibilityGroups
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsExplicitVisibilityGroups];
}

- (BOOL)supportsRayTracingMatrixLayout
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingMatrixLayout];
}

- (BOOL)supportsRayTracingDirectIntersectionResultAccess
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingDirectIntersectionResultAccess];
}

- (BOOL)supportsRayTracingPerComponentMotionInterpolation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsRayTracingPerComponentMotionInterpolation];
}

- (BOOL)supportsExtendedSamplerLODBiasRange
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsExtendedSamplerLODBiasRange];
}

- (BOOL)supportsDeviceCoherency
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 supportsDeviceCoherency];
}

- (id)getDynamicLibraryForBaseObject:(id)a3
{
  dynamicLibraryObjectCache = self->dynamicLibraryObjectCache;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__MTLToolsDevice_getDynamicLibraryForBaseObject___block_invoke;
  v5[3] = &unk_264E12EC8;
  v5[4] = a3;
  v5[5] = self;
  return [(MTLToolsObjectCache *)dynamicLibraryObjectCache getCachedObjectForKey:a3 onMiss:v5];
}

uint64_t __49__MTLToolsDevice_getDynamicLibraryForBaseObject___block_invoke(uint64_t a1)
{
  id v2 = [MTLToolsDynamicLibrary alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return (uint64_t)[(MTLToolsObject *)v2 initWithBaseObject:v3 parent:v4];
}

- (id)getFunctionForBaseObject:(id)a3 library:(id)a4
{
  functionObjectCache = self->functionObjectCache;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__MTLToolsDevice_getFunctionForBaseObject_library___block_invoke;
  v6[3] = &unk_264E12EF0;
  v6[4] = a3;
  v6[5] = a4;
  return [(MTLToolsObjectCache *)functionObjectCache getCachedObjectForKey:a3 onMiss:v6];
}

uint64_t __51__MTLToolsDevice_getFunctionForBaseObject_library___block_invoke(uint64_t a1)
{
  id v2 = [MTLToolsFunction alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return (uint64_t)[(MTLToolsFunction *)v2 initWithFunction:v3 library:v4];
}

- (id)getDepthStencilStateForBaseObject:(id)a3 descriptor:(id)a4
{
  depthStencilObjectCache = self->depthStencilObjectCache;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__MTLToolsDevice_getDepthStencilStateForBaseObject_descriptor___block_invoke;
  v6[3] = &unk_264E13080;
  v6[4] = a3;
  v6[5] = a4;
  void v6[6] = self;
  return [(MTLToolsObjectCache *)depthStencilObjectCache getCachedObjectForKey:a3 onMiss:v6];
}

uint64_t __63__MTLToolsDevice_getDepthStencilStateForBaseObject_descriptor___block_invoke(void *a1)
{
  id v2 = [MTLToolsDepthStencilState alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  return (uint64_t)[(MTLToolsDepthStencilState *)v2 initWithDepthStencilState:v3 descriptor:v4 device:v5];
}

- (id)getSamplerStateForBaseObject:(id)a3 descriptor:(id)a4
{
  samplerObjectCache = self->samplerObjectCache;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__MTLToolsDevice_getSamplerStateForBaseObject_descriptor___block_invoke;
  v6[3] = &unk_264E130A8;
  v6[4] = a3;
  v6[5] = a4;
  void v6[6] = self;
  return [(MTLToolsObjectCache *)samplerObjectCache getCachedObjectForKey:a3 onMiss:v6];
}

uint64_t __58__MTLToolsDevice_getSamplerStateForBaseObject_descriptor___block_invoke(void *a1)
{
  id v2 = [MTLToolsSamplerState alloc];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];

  return (uint64_t)[(MTLToolsSamplerState *)v2 initWithSamplerState:v3 descriptor:v4 device:v5];
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  unint64_t v5 = [v4 heapAccelerationStructureSizeAndAlignWithSize:a3];
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];
  id v5 = unwrapAccelerationStructureDescriptor(a3);

  unint64_t v6 = [v4 heapAccelerationStructureSizeAndAlignWithDescriptor:v5];
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (id)newArgumentEncoderWithBufferBinding:(id)a3
{
  id v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderWithBufferBinding:", a3);
  id v5 = [(MTLToolsObject *)[MTLToolsArgumentEncoder alloc] initWithBaseObject:v4 parent:self];

  return v5;
}

- (id)newIOHandleWithURL:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOHandleWithURL:error:", a3, a4);
  unint64_t v6 = [[MTLToolsIOHandle alloc] initWithBaseObject:v5 parent:self];

  return v6;
}

- (id)newIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  unint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOHandleWithURL:compressionType:error:", a3, a4, a5);
  unint64_t v7 = [[MTLToolsIOHandle alloc] initWithBaseObject:v6 parent:self];

  return v7;
}

- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newUncachedIOHandleWithURL:error:", a3, a4);
  unint64_t v6 = [[MTLToolsIOHandle alloc] initWithBaseObject:v5 parent:self];

  return v6;
}

- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  unint64_t v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newUncachedIOHandleWithURL:compressionType:error:", a3, a4, a5);
  unint64_t v7 = [[MTLToolsIOHandle alloc] initWithBaseObject:v6 parent:self];

  return v7;
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  unint64_t v7 = (void *)[a3 copy];
  if ([a3 scratchBufferAllocator])
  {
    id v8 = -[MTLToolsIOScratchBufferAllocator initWithBaseObject:parent:]([MTLToolsIOScratchBufferAllocator alloc], "initWithBaseObject:parent:", [a3 scratchBufferAllocator], self);
    [v7 setScratchBufferAllocator:v8];
  }
  uint64_t v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIOCommandQueueWithDescriptor:error:", v7, a4);
  id v10 = [[MTLToolsIOCommandQueue alloc] initWithBaseObject:v9 parent:self];

  return v10;
}

- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newPerformanceStateAssertion:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    unint64_t v7 = [(MTLToolsObject *)[MTLToolsPerformanceStateAssertion alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (int64_t)currentPerformanceState
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 currentPerformanceState];
}

- (id)lookupRecompiledBinaryArchive:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  return (id)[v4 lookupRecompiledBinaryArchive:a3];
}

- (MTLCompilerConnectionManager)getCompilerConnectionManager:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  return (MTLCompilerConnectionManager *)[v4 getCompilerConnectionManager:v3];
}

- (BOOL)setCompilerProcessesCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  return [v4 setCompilerProcessesCount:v3];
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 maxAccelerationStructureTraversalDepth];
}

- (BOOL)requiresBFloat16Emulation
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 requiresBFloat16Emulation];
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:iosurface:plane:slice:", a3, a4, a5, a6);
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [(MTLToolsResource *)[MTLToolsTexture alloc] initWithBaseObject:result parent:self];

    return v9;
  }
  return result;
}

- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  id v10 = [(MTLToolsObject *)self baseObject];

  return [v10 isVendorSliceCompatibleWithDeploymentTarget:v9 platform:v8 sdkVersion:v7 compilerPluginVersion:v6];
}

- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newResidencySetWithDescriptor:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = [[MTLToolsResidencySet alloc] initWithBaseObject:result parent:self];

    return v7;
  }
  return result;
}

- (BOOL)isIntegrated
{
  return self->_integrated;
}

- (unint64_t)memorySize
{
  return self->_memorySize;
}

- (void).cxx_destruct
{
}

@end