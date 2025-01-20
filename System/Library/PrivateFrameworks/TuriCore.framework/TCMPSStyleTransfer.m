@interface TCMPSStyleTransfer
+ (id)defineTransformerDescriptor:(unint64_t)a3 tuneAllWeights:(BOOL)a4;
+ (id)defineVGG16Descriptor:(unint64_t)a3;
+ (id)topLeftCropImage:(id)a3 inputHeight:(unint64_t)a4 inputWidth:(unint64_t)a5 outputHeight:(unint64_t)a6 outputWidth:(unint64_t)a7 numChannels:(unint64_t)a8;
+ (void)populateMean:(id)a3;
+ (void)populateMeanCWH:(id)a3 height:(unint64_t)a4 width:(unint64_t)a5;
+ (void)populateMultiplication:(id)a3;
+ (void)populateVarianceCWH:(id)a3 height:(unint64_t)a4 width:(unint64_t)a5;
- (BOOL)updateAllParams;
- (MPSNNGraph)inferenceGraph;
- (MPSNNGraph)trainingGraph;
- (MPSNNImageNode)contenMeanNode;
- (MPSNNImageNode)contentNode;
- (MPSNNImageNode)contentScaleNode;
- (MPSNNImageNode)styleMeanNode;
- (MPSNNImageNode)styleNode;
- (MPSNNImageNode)styleScaleNode;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)dev;
- (TCMPSStyleTransfer)initWithDev:(id)a3 commandQueue:(id)a4 weights:(id)a5 numStyles:(unint64_t)a6;
- (TCMPSStyleTransferPreProcessing)contentPreProcess;
- (TCMPSStyleTransferPreProcessing)contentPreProcessLoss;
- (TCMPSStyleTransferPreProcessing)stylePreProcessLoss;
- (TCMPSStyleTransferTransformerNetwork)model;
- (TCMPSVgg16Network)contentVgg;
- (TCMPSVgg16Network)contentVggLoss;
- (TCMPSVgg16Network)styleVggLoss;
- (float)contentLossMultiplier;
- (float)styleLossMultiplier;
- (float)totalLossMultiplier;
- (id)exportWeights;
- (id)predict:(id)a3;
- (id)train:(id)a3;
- (unint64_t)batchSize;
- (unint64_t)imgHeight;
- (unint64_t)imgWidth;
- (void)checkpoint;
- (void)setBatchSize:(unint64_t)a3;
- (void)setCommandQueue:(id)a3;
- (void)setContenMeanNode:(id)a3;
- (void)setContentLossMultiplier:(float)a3;
- (void)setContentNode:(id)a3;
- (void)setContentPreProcess:(id)a3;
- (void)setContentPreProcessLoss:(id)a3;
- (void)setContentScaleNode:(id)a3;
- (void)setContentVgg:(id)a3;
- (void)setContentVggLoss:(id)a3;
- (void)setDev:(id)a3;
- (void)setImgHeight:(unint64_t)a3;
- (void)setImgWidth:(unint64_t)a3;
- (void)setInferenceGraph:(id)a3;
- (void)setLearningRate:(float)a3;
- (void)setModel:(id)a3;
- (void)setStyleLossMultiplier:(float)a3;
- (void)setStyleMeanNode:(id)a3;
- (void)setStyleNode:(id)a3;
- (void)setStylePreProcessLoss:(id)a3;
- (void)setStyleScaleNode:(id)a3;
- (void)setStyleVggLoss:(id)a3;
- (void)setTotalLossMultiplier:(float)a3;
- (void)setTrainingGraph:(id)a3;
- (void)setUpdateAllParams:(BOOL)a3;
@end

@implementation TCMPSStyleTransfer

+ (id)defineTransformerDescriptor:(unint64_t)a3 tuneAllWeights:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_alloc_init(TCMPSTransformerDescriptor);
  v7 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v8 = [v7 conv];
  [v8 setKernelWidth:9];

  v9 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v10 = [v9 conv];
  [v10 setKernelHeight:9];

  v11 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v12 = [v11 conv];
  [v12 setInputFeatureChannels:3];

  v13 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v14 = [v13 conv];
  [v14 setOutputFeatureChannels:32];

  v15 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v16 = [v15 conv];
  [v16 setStrideWidth:1];

  v17 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v18 = [v17 conv];
  [v18 setStrideHeight:1];

  v19 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v20 = [v19 conv];
  [v20 setPaddingWidth:4];

  v21 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v22 = [v21 conv];
  [v22 setPaddingHeight:4];

  v23 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v24 = [v23 conv];
  [v24 setLabel:@"transformer_encode_1_conv"];

  v25 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v26 = [v25 conv];
  [v26 setUpdateWeights:v4];

  v27 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v28 = [v27 inst];
  [v28 setChannels:32];

  v29 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v30 = [v29 inst];
  [v30 setStyles:a3];

  v31 = [(TCMPSTransformerDescriptor *)v6 encode1];
  v32 = [v31 inst];
  [v32 setLabel:@"transformer_encode_1_inst"];

  v33 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v34 = [v33 conv];
  [v34 setKernelWidth:3];

  v35 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v36 = [v35 conv];
  [v36 setKernelHeight:3];

  v37 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v38 = [v37 conv];
  [v38 setInputFeatureChannels:32];

  v39 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v40 = [v39 conv];
  [v40 setOutputFeatureChannels:64];

  v41 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v42 = [v41 conv];
  [v42 setStrideWidth:2];

  v43 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v44 = [v43 conv];
  [v44 setStrideHeight:2];

  v45 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v46 = [v45 conv];
  [v46 setPaddingWidth:1];

  v47 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v48 = [v47 conv];
  [v48 setPaddingHeight:1];

  v49 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v50 = [v49 conv];
  [v50 setLabel:@"transformer_encode_2_conv"];

  v51 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v52 = [v51 conv];
  [v52 setUpdateWeights:v4];

  v53 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v54 = [v53 inst];
  [v54 setChannels:64];

  v55 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v56 = [v55 inst];
  [v56 setStyles:a3];

  v57 = [(TCMPSTransformerDescriptor *)v6 encode2];
  v58 = [v57 inst];
  [v58 setLabel:@"transformer_encode_2_inst"];

  v59 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v60 = [v59 conv];
  [v60 setKernelWidth:3];

  v61 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v62 = [v61 conv];
  [v62 setKernelHeight:3];

  v63 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v64 = [v63 conv];
  [v64 setInputFeatureChannels:64];

  v65 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v66 = [v65 conv];
  [v66 setOutputFeatureChannels:128];

  v67 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v68 = [v67 conv];
  [v68 setStrideWidth:2];

  v69 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v70 = [v69 conv];
  [v70 setStrideHeight:2];

  v71 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v72 = [v71 conv];
  [v72 setPaddingWidth:1];

  v73 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v74 = [v73 conv];
  [v74 setPaddingHeight:1];

  v75 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v76 = [v75 conv];
  [v76 setLabel:@"transformer_encode_3_conv"];

  v77 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v78 = [v77 conv];
  [v78 setUpdateWeights:v4];

  v79 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v80 = [v79 inst];
  [v80 setChannels:128];

  v81 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v82 = [v81 inst];
  [v82 setStyles:a3];

  v83 = [(TCMPSTransformerDescriptor *)v6 encode3];
  v84 = [v83 inst];
  [v84 setLabel:@"transformer_encode_3_inst"];

  v85 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v86 = [v85 conv1];
  [v86 setKernelWidth:3];

  v87 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v88 = [v87 conv1];
  [v88 setKernelHeight:3];

  v89 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v90 = [v89 conv1];
  [v90 setInputFeatureChannels:128];

  v91 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v92 = [v91 conv1];
  [v92 setOutputFeatureChannels:128];

  v93 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v94 = [v93 conv1];
  [v94 setStrideWidth:1];

  v95 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v96 = [v95 conv1];
  [v96 setStrideHeight:1];

  v97 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v98 = [v97 conv1];
  [v98 setPaddingWidth:1];

  v99 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v100 = [v99 conv1];
  [v100 setPaddingHeight:1];

  v101 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v102 = [v101 conv1];
  [v102 setLabel:@"transformer_residual_1_conv_1"];

  v103 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v104 = [v103 conv1];
  [v104 setUpdateWeights:v4];

  v105 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v106 = [v105 conv2];
  [v106 setKernelWidth:3];

  v107 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v108 = [v107 conv2];
  [v108 setKernelHeight:3];

  v109 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v110 = [v109 conv2];
  [v110 setInputFeatureChannels:128];

  v111 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v112 = [v111 conv2];
  [v112 setOutputFeatureChannels:128];

  v113 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v114 = [v113 conv2];
  [v114 setStrideWidth:1];

  v115 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v116 = [v115 conv2];
  [v116 setStrideHeight:1];

  v117 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v118 = [v117 conv2];
  [v118 setPaddingWidth:1];

  v119 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v120 = [v119 conv2];
  [v120 setPaddingHeight:1];

  v121 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v122 = [v121 conv2];
  [v122 setLabel:@"transformer_residual_1_conv_2"];

  v123 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v124 = [v123 conv2];
  [v124 setUpdateWeights:v4];

  v125 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v126 = [v125 inst1];
  [v126 setChannels:128];

  v127 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v128 = [v127 inst1];
  [v128 setStyles:a3];

  v129 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v130 = [v129 inst1];
  [v130 setLabel:@"transformer_residual_1_inst_1"];

  v131 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v132 = [v131 inst2];
  [v132 setChannels:128];

  v133 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v134 = [v133 inst2];
  [v134 setStyles:a3];

  v135 = [(TCMPSTransformerDescriptor *)v6 residual1];
  v136 = [v135 inst2];
  [v136 setLabel:@"transformer_residual_1_inst_2"];

  v137 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v138 = [v137 conv1];
  [v138 setKernelWidth:3];

  v139 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v140 = [v139 conv1];
  [v140 setKernelHeight:3];

  v141 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v142 = [v141 conv1];
  [v142 setInputFeatureChannels:128];

  v143 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v144 = [v143 conv1];
  [v144 setOutputFeatureChannels:128];

  v145 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v146 = [v145 conv1];
  [v146 setStrideWidth:1];

  v147 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v148 = [v147 conv1];
  [v148 setStrideHeight:1];

  v149 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v150 = [v149 conv1];
  [v150 setPaddingWidth:1];

  v151 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v152 = [v151 conv1];
  [v152 setPaddingHeight:1];

  v153 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v154 = [v153 conv1];
  [v154 setLabel:@"transformer_residual_2_conv_1"];

  v155 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v156 = [v155 conv1];
  [v156 setUpdateWeights:v4];

  v157 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v158 = [v157 conv2];
  [v158 setKernelWidth:3];

  v159 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v160 = [v159 conv2];
  [v160 setKernelHeight:3];

  v161 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v162 = [v161 conv2];
  [v162 setInputFeatureChannels:128];

  v163 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v164 = [v163 conv2];
  [v164 setOutputFeatureChannels:128];

  v165 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v166 = [v165 conv2];
  [v166 setStrideWidth:1];

  v167 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v168 = [v167 conv2];
  [v168 setStrideHeight:1];

  v169 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v170 = [v169 conv2];
  [v170 setPaddingWidth:1];

  v171 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v172 = [v171 conv2];
  [v172 setPaddingHeight:1];

  v173 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v174 = [v173 conv2];
  [v174 setLabel:@"transformer_residual_2_conv_2"];

  v175 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v176 = [v175 conv2];
  [v176 setUpdateWeights:v4];

  v177 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v178 = [v177 inst1];
  [v178 setChannels:128];

  v179 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v180 = [v179 inst1];
  [v180 setStyles:a3];

  v181 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v182 = [v181 inst1];
  [v182 setLabel:@"transformer_residual_2_inst_1"];

  v183 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v184 = [v183 inst2];
  [v184 setChannels:128];

  v185 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v186 = [v185 inst2];
  [v186 setStyles:a3];

  v187 = [(TCMPSTransformerDescriptor *)v6 residual2];
  v188 = [v187 inst2];
  [v188 setLabel:@"transformer_residual_2_inst_2"];

  v189 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v190 = [v189 conv1];
  [v190 setKernelWidth:3];

  v191 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v192 = [v191 conv1];
  [v192 setKernelHeight:3];

  v193 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v194 = [v193 conv1];
  [v194 setInputFeatureChannels:128];

  v195 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v196 = [v195 conv1];
  [v196 setOutputFeatureChannels:128];

  v197 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v198 = [v197 conv1];
  [v198 setStrideWidth:1];

  v199 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v200 = [v199 conv1];
  [v200 setStrideHeight:1];

  v201 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v202 = [v201 conv1];
  [v202 setPaddingWidth:1];

  v203 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v204 = [v203 conv1];
  [v204 setPaddingHeight:1];

  v205 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v206 = [v205 conv1];
  [v206 setLabel:@"transformer_residual_3_conv_1"];

  v207 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v208 = [v207 conv1];
  [v208 setUpdateWeights:v4];

  v209 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v210 = [v209 conv2];
  [v210 setKernelWidth:3];

  v211 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v212 = [v211 conv2];
  [v212 setKernelHeight:3];

  v213 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v214 = [v213 conv2];
  [v214 setInputFeatureChannels:128];

  v215 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v216 = [v215 conv2];
  [v216 setOutputFeatureChannels:128];

  v217 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v218 = [v217 conv2];
  [v218 setStrideWidth:1];

  v219 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v220 = [v219 conv2];
  [v220 setStrideHeight:1];

  v221 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v222 = [v221 conv2];
  [v222 setPaddingWidth:1];

  v223 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v224 = [v223 conv2];
  [v224 setPaddingHeight:1];

  v225 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v226 = [v225 conv2];
  [v226 setLabel:@"transformer_residual_3_conv_2"];

  v227 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v228 = [v227 conv2];
  [v228 setUpdateWeights:v4];

  v229 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v230 = [v229 inst1];
  [v230 setChannels:128];

  v231 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v232 = [v231 inst1];
  [v232 setStyles:a3];

  v233 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v234 = [v233 inst1];
  [v234 setLabel:@"transformer_residual_3_inst_1"];

  v235 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v236 = [v235 inst2];
  [v236 setChannels:128];

  v237 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v238 = [v237 inst2];
  [v238 setStyles:a3];

  v239 = [(TCMPSTransformerDescriptor *)v6 residual3];
  v240 = [v239 inst2];
  [v240 setLabel:@"transformer_residual_3_inst_2"];

  v241 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v242 = [v241 conv1];
  [v242 setKernelWidth:3];

  v243 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v244 = [v243 conv1];
  [v244 setKernelHeight:3];

  v245 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v246 = [v245 conv1];
  [v246 setInputFeatureChannels:128];

  v247 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v248 = [v247 conv1];
  [v248 setOutputFeatureChannels:128];

  v249 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v250 = [v249 conv1];
  [v250 setStrideWidth:1];

  v251 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v252 = [v251 conv1];
  [v252 setStrideHeight:1];

  v253 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v254 = [v253 conv1];
  [v254 setPaddingWidth:1];

  v255 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v256 = [v255 conv1];
  [v256 setPaddingHeight:1];

  v257 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v258 = [v257 conv1];
  [v258 setLabel:@"transformer_residual_4_conv_1"];

  v259 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v260 = [v259 conv1];
  [v260 setUpdateWeights:v4];

  v261 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v262 = [v261 conv2];
  [v262 setKernelWidth:3];

  v263 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v264 = [v263 conv2];
  [v264 setKernelHeight:3];

  v265 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v266 = [v265 conv2];
  [v266 setInputFeatureChannels:128];

  v267 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v268 = [v267 conv2];
  [v268 setOutputFeatureChannels:128];

  v269 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v270 = [v269 conv2];
  [v270 setStrideWidth:1];

  v271 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v272 = [v271 conv2];
  [v272 setStrideHeight:1];

  v273 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v274 = [v273 conv2];
  [v274 setPaddingWidth:1];

  v275 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v276 = [v275 conv2];
  [v276 setPaddingHeight:1];

  v277 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v278 = [v277 conv2];
  [v278 setLabel:@"transformer_residual_4_conv_2"];

  v279 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v280 = [v279 conv2];
  [v280 setUpdateWeights:v4];

  v281 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v282 = [v281 inst1];
  [v282 setChannels:128];

  v283 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v284 = [v283 inst1];
  [v284 setStyles:a3];

  v285 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v286 = [v285 inst1];
  [v286 setLabel:@"transformer_residual_4_inst_1"];

  v287 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v288 = [v287 inst2];
  [v288 setChannels:128];

  v289 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v290 = [v289 inst2];
  [v290 setStyles:a3];

  v291 = [(TCMPSTransformerDescriptor *)v6 residual4];
  v292 = [v291 inst2];
  [v292 setLabel:@"transformer_residual_4_inst_2"];

  v293 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v294 = [v293 conv1];
  [v294 setKernelWidth:3];

  v295 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v296 = [v295 conv1];
  [v296 setKernelHeight:3];

  v297 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v298 = [v297 conv1];
  [v298 setInputFeatureChannels:128];

  v299 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v300 = [v299 conv1];
  [v300 setOutputFeatureChannels:128];

  v301 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v302 = [v301 conv1];
  [v302 setStrideWidth:1];

  v303 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v304 = [v303 conv1];
  [v304 setStrideHeight:1];

  v305 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v306 = [v305 conv1];
  [v306 setPaddingWidth:1];

  v307 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v308 = [v307 conv1];
  [v308 setPaddingHeight:1];

  v309 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v310 = [v309 conv1];
  [v310 setLabel:@"transformer_residual_5_conv_1"];

  v311 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v312 = [v311 conv1];
  [v312 setUpdateWeights:v4];

  v313 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v314 = [v313 conv2];
  [v314 setKernelWidth:3];

  v315 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v316 = [v315 conv2];
  [v316 setKernelHeight:3];

  v317 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v318 = [v317 conv2];
  [v318 setInputFeatureChannels:128];

  v319 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v320 = [v319 conv2];
  [v320 setOutputFeatureChannels:128];

  v321 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v322 = [v321 conv2];
  [v322 setStrideWidth:1];

  v323 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v324 = [v323 conv2];
  [v324 setStrideHeight:1];

  v325 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v326 = [v325 conv2];
  [v326 setPaddingWidth:1];

  v327 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v328 = [v327 conv2];
  [v328 setPaddingHeight:1];

  v329 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v330 = [v329 conv2];
  [v330 setLabel:@"transformer_residual_5_conv_2"];

  v331 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v332 = [v331 conv2];
  [v332 setUpdateWeights:v4];

  v333 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v334 = [v333 inst1];
  [v334 setChannels:128];

  v335 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v336 = [v335 inst1];
  [v336 setStyles:a3];

  v337 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v338 = [v337 inst1];
  [v338 setLabel:@"transformer_residual_5_inst_1"];

  v339 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v340 = [v339 inst2];
  [v340 setChannels:128];

  v341 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v342 = [v341 inst2];
  [v342 setStyles:a3];

  v343 = [(TCMPSTransformerDescriptor *)v6 residual5];
  v344 = [v343 inst2];
  [v344 setLabel:@"transformer_residual_5_inst_2"];

  v345 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v346 = [v345 conv];
  [v346 setKernelWidth:3];

  v347 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v348 = [v347 conv];
  [v348 setKernelHeight:3];

  v349 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v350 = [v349 conv];
  [v350 setInputFeatureChannels:128];

  v351 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v352 = [v351 conv];
  [v352 setOutputFeatureChannels:64];

  v353 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v354 = [v353 conv];
  [v354 setStrideWidth:1];

  v355 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v356 = [v355 conv];
  [v356 setStrideHeight:1];

  v357 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v358 = [v357 conv];
  [v358 setPaddingWidth:1];

  v359 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v360 = [v359 conv];
  [v360 setPaddingHeight:1];

  v361 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v362 = [v361 conv];
  [v362 setLabel:@"transformer_decode_1_conv"];

  v363 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v364 = [v363 conv];
  [v364 setUpdateWeights:v4];

  v365 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v366 = [v365 inst];
  [v366 setChannels:64];

  v367 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v368 = [v367 inst];
  [v368 setStyles:a3];

  v369 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v370 = [v369 inst];
  [v370 setLabel:@"transformer_decode_1_inst"];

  v371 = [(TCMPSTransformerDescriptor *)v6 decode1];
  v372 = [v371 upsample];
  [v372 setScale:2];

  v373 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v374 = [v373 conv];
  [v374 setKernelWidth:3];

  v375 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v376 = [v375 conv];
  [v376 setKernelHeight:3];

  v377 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v378 = [v377 conv];
  [v378 setInputFeatureChannels:64];

  v379 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v380 = [v379 conv];
  [v380 setOutputFeatureChannels:32];

  v381 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v382 = [v381 conv];
  [v382 setStrideWidth:1];

  v383 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v384 = [v383 conv];
  [v384 setStrideHeight:1];

  v385 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v386 = [v385 conv];
  [v386 setPaddingWidth:1];

  v387 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v388 = [v387 conv];
  [v388 setPaddingHeight:1];

  v389 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v390 = [v389 conv];
  [v390 setLabel:@"transformer_decode_2_conv"];

  v391 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v392 = [v391 conv];
  [v392 setUpdateWeights:v4];

  v393 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v394 = [v393 inst];
  [v394 setChannels:32];

  v395 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v396 = [v395 inst];
  [v396 setStyles:a3];

  v397 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v398 = [v397 inst];
  [v398 setLabel:@"transformer_decode_2_inst"];

  v399 = [(TCMPSTransformerDescriptor *)v6 decode2];
  v400 = [v399 upsample];
  [v400 setScale:2];

  v401 = [(TCMPSTransformerDescriptor *)v6 conv];
  [v401 setKernelWidth:9];

  v402 = [(TCMPSTransformerDescriptor *)v6 conv];
  [v402 setKernelHeight:9];

  v403 = [(TCMPSTransformerDescriptor *)v6 conv];
  [v403 setInputFeatureChannels:32];

  v404 = [(TCMPSTransformerDescriptor *)v6 conv];
  [v404 setOutputFeatureChannels:3];

  v405 = [(TCMPSTransformerDescriptor *)v6 conv];
  [v405 setStrideWidth:1];

  v406 = [(TCMPSTransformerDescriptor *)v6 conv];
  [v406 setStrideHeight:1];

  v407 = [(TCMPSTransformerDescriptor *)v6 conv];
  [v407 setPaddingWidth:4];

  v408 = [(TCMPSTransformerDescriptor *)v6 conv];
  [v408 setPaddingHeight:4];

  v409 = [(TCMPSTransformerDescriptor *)v6 conv];
  [v409 setLabel:@"transformer_decode_3_conv"];

  v410 = [(TCMPSTransformerDescriptor *)v6 conv];
  [v410 setUpdateWeights:v4];

  v411 = [(TCMPSTransformerDescriptor *)v6 inst];
  [v411 setChannels:3];

  v412 = [(TCMPSTransformerDescriptor *)v6 inst];
  [v412 setStyles:a3];

  v413 = [(TCMPSTransformerDescriptor *)v6 inst];
  [v413 setLabel:@"transformer_decode_3_inst"];

  return v6;
}

+ (id)defineVGG16Descriptor:(unint64_t)a3
{
  v3 = objc_alloc_init(TCMPSVgg16Descriptor);
  BOOL v4 = [(TCMPSVgg16Descriptor *)v3 block1];
  v5 = [v4 conv1];
  [v5 setKernelWidth:3];

  v6 = [(TCMPSVgg16Descriptor *)v3 block1];
  v7 = [v6 conv1];
  [v7 setKernelHeight:3];

  v8 = [(TCMPSVgg16Descriptor *)v3 block1];
  v9 = [v8 conv1];
  [v9 setInputFeatureChannels:3];

  v10 = [(TCMPSVgg16Descriptor *)v3 block1];
  v11 = [v10 conv1];
  [v11 setOutputFeatureChannels:64];

  v12 = [(TCMPSVgg16Descriptor *)v3 block1];
  v13 = [v12 conv1];
  [v13 setStrideWidth:1];

  v14 = [(TCMPSVgg16Descriptor *)v3 block1];
  v15 = [v14 conv1];
  [v15 setStrideHeight:1];

  v16 = [(TCMPSVgg16Descriptor *)v3 block1];
  v17 = [v16 conv1];
  [v17 setPaddingWidth:1];

  v18 = [(TCMPSVgg16Descriptor *)v3 block1];
  v19 = [v18 conv1];
  [v19 setPaddingHeight:1];

  v20 = [(TCMPSVgg16Descriptor *)v3 block1];
  v21 = [v20 conv1];
  [v21 setLabel:@"vgg16_block_1_conv_1"];

  v22 = [(TCMPSVgg16Descriptor *)v3 block1];
  v23 = [v22 conv1];
  [v23 setUpdateWeights:0];

  v24 = [(TCMPSVgg16Descriptor *)v3 block1];
  v25 = [v24 conv2];
  [v25 setKernelWidth:3];

  v26 = [(TCMPSVgg16Descriptor *)v3 block1];
  v27 = [v26 conv2];
  [v27 setKernelHeight:3];

  v28 = [(TCMPSVgg16Descriptor *)v3 block1];
  v29 = [v28 conv2];
  [v29 setInputFeatureChannels:64];

  v30 = [(TCMPSVgg16Descriptor *)v3 block1];
  v31 = [v30 conv2];
  [v31 setOutputFeatureChannels:64];

  v32 = [(TCMPSVgg16Descriptor *)v3 block1];
  v33 = [v32 conv2];
  [v33 setStrideWidth:1];

  v34 = [(TCMPSVgg16Descriptor *)v3 block1];
  v35 = [v34 conv2];
  [v35 setStrideHeight:1];

  v36 = [(TCMPSVgg16Descriptor *)v3 block1];
  v37 = [v36 conv2];
  [v37 setPaddingWidth:1];

  v38 = [(TCMPSVgg16Descriptor *)v3 block1];
  v39 = [v38 conv2];
  [v39 setPaddingHeight:1];

  v40 = [(TCMPSVgg16Descriptor *)v3 block1];
  v41 = [v40 conv2];
  [v41 setLabel:@"vgg16_block_1_conv_2"];

  v42 = [(TCMPSVgg16Descriptor *)v3 block1];
  v43 = [v42 conv2];
  [v43 setUpdateWeights:0];

  v44 = [(TCMPSVgg16Descriptor *)v3 block1];
  v45 = [v44 pooling];
  [v45 setKernelSize:2];

  v46 = [(TCMPSVgg16Descriptor *)v3 block1];
  v47 = [v46 pooling];
  [v47 setStrideSize:2];

  v48 = [(TCMPSVgg16Descriptor *)v3 block2];
  v49 = [v48 conv1];
  [v49 setKernelWidth:3];

  v50 = [(TCMPSVgg16Descriptor *)v3 block2];
  v51 = [v50 conv1];
  [v51 setKernelHeight:3];

  v52 = [(TCMPSVgg16Descriptor *)v3 block2];
  v53 = [v52 conv1];
  [v53 setInputFeatureChannels:64];

  v54 = [(TCMPSVgg16Descriptor *)v3 block2];
  v55 = [v54 conv1];
  [v55 setOutputFeatureChannels:128];

  v56 = [(TCMPSVgg16Descriptor *)v3 block2];
  v57 = [v56 conv1];
  [v57 setStrideWidth:1];

  v58 = [(TCMPSVgg16Descriptor *)v3 block2];
  v59 = [v58 conv1];
  [v59 setStrideHeight:1];

  v60 = [(TCMPSVgg16Descriptor *)v3 block2];
  v61 = [v60 conv1];
  [v61 setPaddingWidth:1];

  v62 = [(TCMPSVgg16Descriptor *)v3 block2];
  v63 = [v62 conv1];
  [v63 setPaddingHeight:1];

  v64 = [(TCMPSVgg16Descriptor *)v3 block2];
  v65 = [v64 conv1];
  [v65 setLabel:@"vgg16_block_2_conv_1"];

  v66 = [(TCMPSVgg16Descriptor *)v3 block2];
  v67 = [v66 conv1];
  [v67 setUpdateWeights:0];

  v68 = [(TCMPSVgg16Descriptor *)v3 block2];
  v69 = [v68 conv2];
  [v69 setKernelWidth:3];

  v70 = [(TCMPSVgg16Descriptor *)v3 block2];
  v71 = [v70 conv2];
  [v71 setKernelHeight:3];

  v72 = [(TCMPSVgg16Descriptor *)v3 block2];
  v73 = [v72 conv2];
  [v73 setInputFeatureChannels:128];

  v74 = [(TCMPSVgg16Descriptor *)v3 block2];
  v75 = [v74 conv2];
  [v75 setOutputFeatureChannels:128];

  v76 = [(TCMPSVgg16Descriptor *)v3 block2];
  v77 = [v76 conv2];
  [v77 setStrideWidth:1];

  v78 = [(TCMPSVgg16Descriptor *)v3 block2];
  v79 = [v78 conv2];
  [v79 setStrideHeight:1];

  v80 = [(TCMPSVgg16Descriptor *)v3 block2];
  v81 = [v80 conv2];
  [v81 setPaddingWidth:1];

  v82 = [(TCMPSVgg16Descriptor *)v3 block2];
  v83 = [v82 conv2];
  [v83 setPaddingHeight:1];

  v84 = [(TCMPSVgg16Descriptor *)v3 block2];
  v85 = [v84 conv2];
  [v85 setLabel:@"vgg16_block_2_conv_2"];

  v86 = [(TCMPSVgg16Descriptor *)v3 block2];
  v87 = [v86 conv2];
  [v87 setUpdateWeights:0];

  v88 = [(TCMPSVgg16Descriptor *)v3 block2];
  v89 = [v88 pooling];
  [v89 setKernelSize:2];

  v90 = [(TCMPSVgg16Descriptor *)v3 block2];
  v91 = [v90 pooling];
  [v91 setStrideSize:2];

  v92 = [(TCMPSVgg16Descriptor *)v3 block3];
  v93 = [v92 conv1];
  [v93 setKernelWidth:3];

  v94 = [(TCMPSVgg16Descriptor *)v3 block3];
  v95 = [v94 conv1];
  [v95 setKernelHeight:3];

  v96 = [(TCMPSVgg16Descriptor *)v3 block3];
  v97 = [v96 conv1];
  [v97 setInputFeatureChannels:128];

  v98 = [(TCMPSVgg16Descriptor *)v3 block3];
  v99 = [v98 conv1];
  [v99 setOutputFeatureChannels:256];

  v100 = [(TCMPSVgg16Descriptor *)v3 block3];
  v101 = [v100 conv1];
  [v101 setStrideWidth:1];

  v102 = [(TCMPSVgg16Descriptor *)v3 block3];
  v103 = [v102 conv1];
  [v103 setStrideHeight:1];

  v104 = [(TCMPSVgg16Descriptor *)v3 block3];
  v105 = [v104 conv1];
  [v105 setPaddingWidth:1];

  v106 = [(TCMPSVgg16Descriptor *)v3 block3];
  v107 = [v106 conv1];
  [v107 setPaddingHeight:1];

  v108 = [(TCMPSVgg16Descriptor *)v3 block3];
  v109 = [v108 conv1];
  [v109 setLabel:@"vgg16_block_3_conv_1"];

  v110 = [(TCMPSVgg16Descriptor *)v3 block3];
  v111 = [v110 conv1];
  [v111 setUpdateWeights:0];

  v112 = [(TCMPSVgg16Descriptor *)v3 block3];
  v113 = [v112 conv2];
  [v113 setKernelWidth:3];

  v114 = [(TCMPSVgg16Descriptor *)v3 block3];
  v115 = [v114 conv2];
  [v115 setKernelHeight:3];

  v116 = [(TCMPSVgg16Descriptor *)v3 block3];
  v117 = [v116 conv2];
  [v117 setInputFeatureChannels:256];

  v118 = [(TCMPSVgg16Descriptor *)v3 block3];
  v119 = [v118 conv2];
  [v119 setOutputFeatureChannels:256];

  v120 = [(TCMPSVgg16Descriptor *)v3 block3];
  v121 = [v120 conv2];
  [v121 setStrideWidth:1];

  v122 = [(TCMPSVgg16Descriptor *)v3 block3];
  v123 = [v122 conv2];
  [v123 setStrideHeight:1];

  v124 = [(TCMPSVgg16Descriptor *)v3 block3];
  v125 = [v124 conv2];
  [v125 setPaddingWidth:1];

  v126 = [(TCMPSVgg16Descriptor *)v3 block3];
  v127 = [v126 conv2];
  [v127 setPaddingHeight:1];

  v128 = [(TCMPSVgg16Descriptor *)v3 block3];
  v129 = [v128 conv2];
  [v129 setLabel:@"vgg16_block_3_conv_2"];

  v130 = [(TCMPSVgg16Descriptor *)v3 block3];
  v131 = [v130 conv2];
  [v131 setUpdateWeights:0];

  v132 = [(TCMPSVgg16Descriptor *)v3 block3];
  v133 = [v132 conv3];
  [v133 setKernelWidth:3];

  v134 = [(TCMPSVgg16Descriptor *)v3 block3];
  v135 = [v134 conv3];
  [v135 setKernelHeight:3];

  v136 = [(TCMPSVgg16Descriptor *)v3 block3];
  v137 = [v136 conv3];
  [v137 setInputFeatureChannels:256];

  v138 = [(TCMPSVgg16Descriptor *)v3 block3];
  v139 = [v138 conv3];
  [v139 setOutputFeatureChannels:256];

  v140 = [(TCMPSVgg16Descriptor *)v3 block3];
  v141 = [v140 conv3];
  [v141 setStrideWidth:1];

  v142 = [(TCMPSVgg16Descriptor *)v3 block3];
  v143 = [v142 conv3];
  [v143 setStrideHeight:1];

  v144 = [(TCMPSVgg16Descriptor *)v3 block3];
  v145 = [v144 conv3];
  [v145 setPaddingWidth:1];

  v146 = [(TCMPSVgg16Descriptor *)v3 block3];
  v147 = [v146 conv3];
  [v147 setPaddingHeight:1];

  v148 = [(TCMPSVgg16Descriptor *)v3 block3];
  v149 = [v148 conv3];
  [v149 setLabel:@"vgg16_block_3_conv_3"];

  v150 = [(TCMPSVgg16Descriptor *)v3 block3];
  v151 = [v150 conv3];
  [v151 setUpdateWeights:0];

  v152 = [(TCMPSVgg16Descriptor *)v3 block3];
  v153 = [v152 pooling];
  [v153 setKernelSize:2];

  v154 = [(TCMPSVgg16Descriptor *)v3 block3];
  v155 = [v154 pooling];
  [v155 setStrideSize:2];

  v156 = [(TCMPSVgg16Descriptor *)v3 block4];
  v157 = [v156 conv1];
  [v157 setKernelWidth:3];

  v158 = [(TCMPSVgg16Descriptor *)v3 block4];
  v159 = [v158 conv1];
  [v159 setKernelHeight:3];

  v160 = [(TCMPSVgg16Descriptor *)v3 block4];
  v161 = [v160 conv1];
  [v161 setInputFeatureChannels:256];

  v162 = [(TCMPSVgg16Descriptor *)v3 block4];
  v163 = [v162 conv1];
  [v163 setOutputFeatureChannels:512];

  v164 = [(TCMPSVgg16Descriptor *)v3 block4];
  v165 = [v164 conv1];
  [v165 setStrideWidth:1];

  v166 = [(TCMPSVgg16Descriptor *)v3 block4];
  v167 = [v166 conv1];
  [v167 setStrideHeight:1];

  v168 = [(TCMPSVgg16Descriptor *)v3 block4];
  v169 = [v168 conv1];
  [v169 setPaddingWidth:1];

  v170 = [(TCMPSVgg16Descriptor *)v3 block4];
  v171 = [v170 conv1];
  [v171 setPaddingHeight:1];

  v172 = [(TCMPSVgg16Descriptor *)v3 block4];
  v173 = [v172 conv1];
  [v173 setLabel:@"vgg16_block_4_conv_1"];

  v174 = [(TCMPSVgg16Descriptor *)v3 block4];
  v175 = [v174 conv1];
  [v175 setUpdateWeights:0];

  v176 = [(TCMPSVgg16Descriptor *)v3 block4];
  v177 = [v176 conv2];
  [v177 setKernelWidth:3];

  v178 = [(TCMPSVgg16Descriptor *)v3 block4];
  v179 = [v178 conv2];
  [v179 setKernelHeight:3];

  v180 = [(TCMPSVgg16Descriptor *)v3 block4];
  v181 = [v180 conv2];
  [v181 setInputFeatureChannels:512];

  v182 = [(TCMPSVgg16Descriptor *)v3 block4];
  v183 = [v182 conv2];
  [v183 setOutputFeatureChannels:512];

  v184 = [(TCMPSVgg16Descriptor *)v3 block4];
  v185 = [v184 conv2];
  [v185 setStrideWidth:1];

  v186 = [(TCMPSVgg16Descriptor *)v3 block4];
  v187 = [v186 conv2];
  [v187 setStrideHeight:1];

  v188 = [(TCMPSVgg16Descriptor *)v3 block4];
  v189 = [v188 conv2];
  [v189 setPaddingWidth:1];

  v190 = [(TCMPSVgg16Descriptor *)v3 block4];
  v191 = [v190 conv2];
  [v191 setPaddingHeight:1];

  v192 = [(TCMPSVgg16Descriptor *)v3 block4];
  v193 = [v192 conv2];
  [v193 setLabel:@"vgg16_block_4_conv_2"];

  v194 = [(TCMPSVgg16Descriptor *)v3 block4];
  v195 = [v194 conv2];
  [v195 setUpdateWeights:0];

  v196 = [(TCMPSVgg16Descriptor *)v3 block4];
  v197 = [v196 conv3];
  [v197 setKernelWidth:3];

  v198 = [(TCMPSVgg16Descriptor *)v3 block4];
  v199 = [v198 conv3];
  [v199 setKernelHeight:3];

  v200 = [(TCMPSVgg16Descriptor *)v3 block4];
  v201 = [v200 conv3];
  [v201 setInputFeatureChannels:512];

  v202 = [(TCMPSVgg16Descriptor *)v3 block4];
  v203 = [v202 conv3];
  [v203 setOutputFeatureChannels:512];

  v204 = [(TCMPSVgg16Descriptor *)v3 block4];
  v205 = [v204 conv3];
  [v205 setStrideWidth:1];

  v206 = [(TCMPSVgg16Descriptor *)v3 block4];
  v207 = [v206 conv3];
  [v207 setStrideHeight:1];

  v208 = [(TCMPSVgg16Descriptor *)v3 block4];
  v209 = [v208 conv3];
  [v209 setPaddingWidth:1];

  v210 = [(TCMPSVgg16Descriptor *)v3 block4];
  v211 = [v210 conv3];
  [v211 setPaddingHeight:1];

  v212 = [(TCMPSVgg16Descriptor *)v3 block4];
  v213 = [v212 conv3];
  [v213 setLabel:@"vgg16_block_4_conv_3"];

  v214 = [(TCMPSVgg16Descriptor *)v3 block4];
  v215 = [v214 conv3];
  [v215 setUpdateWeights:0];

  v216 = [(TCMPSVgg16Descriptor *)v3 block4];
  v217 = [v216 pooling];
  [v217 setKernelSize:2];

  v218 = [(TCMPSVgg16Descriptor *)v3 block4];
  v219 = [v218 pooling];
  [v219 setStrideSize:2];

  return v3;
}

+ (void)populateMean:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [v5 length];
  if (0xAAAAAAAAAAAAAAABLL * (v6 >> 2) >= 0x5555555555555556)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"mps_style_transfer_utils.m" lineNumber:479 description:@"Data must follow a 3 channel format"];
  }
  id v10 = v5;
  unint64_t v7 = [v10 mutableBytes];
  if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFCLL) >= 1)
  {
    unint64_t v8 = v7 + 4 * (v6 >> 2);
    do
    {
      *(void *)unint64_t v7 = 0x42E98ED942F75C29;
      *(_DWORD *)(v7 + 8) = 1120919749;
      v7 += 12;
    }
    while (v7 < v8);
  }
}

+ (void)populateMultiplication:(id)a3
{
  id v11 = a3;
  unint64_t v5 = [v11 length];
  unint64_t v6 = v5 >> 2;
  if (0xAAAAAAAAAAAAAAABLL * (v5 >> 2) >= 0x5555555555555556)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"mps_style_transfer_utils.m" lineNumber:494 description:@"Data must follow a 3 channel format"];
  }
  unint64_t v7 = v11;
  if (v5 >= 4)
  {
    uint64_t v8 = 0;
    if (v6 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v6;
    }
    do
    {
      *(_DWORD *)([v11 mutableBytes] + 4 * v8) = 1132396544;
      unint64_t v7 = v11;
      ++v8;
    }
    while (v9 != v8);
  }
}

+ (void)populateMeanCWH:(id)a3 height:(unint64_t)a4 width:(unint64_t)a5
{
  id v9 = a3;
  if (0xAAAAAAAAAAAAAAABLL * ((unint64_t)[v9 length] >> 2) >= 0x5555555555555556)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"mps_style_transfer_utils.m" lineNumber:501 description:@"Data must follow a 3 channel format"];
  }
  id v16 = v9;
  uint64_t v10 = [v16 mutableBytes];
  uint64_t v11 = 0;
  unint64_t v12 = a5 * a4;
  do
  {
    if (v12)
    {
      uint64_t v13 = 0;
      int v14 = dword_2246B7BD8[v11];
      do
        *(_DWORD *)(v10 + 4 * v13++) = v14;
      while (v12 != v13);
    }
    ++v11;
    v10 += 4 * a5 * a4;
  }
  while (v11 != 3);
}

+ (void)populateVarianceCWH:(id)a3 height:(unint64_t)a4 width:(unint64_t)a5
{
  id v9 = a3;
  if (0xAAAAAAAAAAAAAAABLL * ((unint64_t)[v9 length] >> 2) >= 0x5555555555555556)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"mps_style_transfer_utils.m" lineNumber:518 description:@"Data must follow a 3 channel format"];
  }
  id v16 = v9;
  uint64_t v10 = [v16 mutableBytes];
  uint64_t v11 = 0;
  unint64_t v12 = a5 * a4;
  do
  {
    if (v12)
    {
      uint64_t v13 = 0;
      int v14 = dword_2246B7BE4[v11];
      do
        *(_DWORD *)(v10 + 4 * v13++) = v14;
      while (v12 != v13);
    }
    ++v11;
    v10 += 4 * a5 * a4;
  }
  while (v11 != 3);
}

- (TCMPSStyleTransfer)initWithDev:(id)a3 commandQueue:(id)a4 weights:(id)a5 numStyles:(unint64_t)a6
{
  v191[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v186.receiver = self;
  v186.super_class = (Class)TCMPSStyleTransfer;
  int v14 = [(TCMPSStyleTransfer *)&v186 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dev, a3);
    objc_storeStrong((id *)&v15->_commandQueue, a4);
    *(void *)&v15->_contentLossMultiplier = 0x38D1B7173F800000;
    v15->_totalLossMultiplier = 0.0001;
    v15->_updateAllParams = 1;
    *(_OWORD *)&v15->_batchSize = xmmword_2246B7C00;
    v15->_imgHeight = 256;
    id v16 = (void *)MEMORY[0x263F13380];
    id v179 = v12;
    v17 = [[TCMPSGraphNodeHandle alloc] initWithLabel:@"contentImage"];
    uint64_t v18 = [v16 nodeWithHandle:v17];
    contentNode = v15->_contentNode;
    v15->_contentNode = (MPSNNImageNode *)v18;

    v20 = (void *)MEMORY[0x263F13380];
    v21 = [[TCMPSGraphNodeHandle alloc] initWithLabel:@"contentScaleImage"];
    uint64_t v22 = [v20 nodeWithHandle:v21];
    contentScaleNode = v15->_contentScaleNode;
    v15->_contentScaleNode = (MPSNNImageNode *)v22;

    v24 = (void *)MEMORY[0x263F13380];
    v25 = [[TCMPSGraphNodeHandle alloc] initWithLabel:@"contentMeanImage"];
    uint64_t v26 = [v24 nodeWithHandle:v25];
    contenMeanNode = v15->_contenMeanNode;
    v15->_contenMeanNode = (MPSNNImageNode *)v26;

    v28 = (void *)MEMORY[0x263F13380];
    v29 = [[TCMPSGraphNodeHandle alloc] initWithLabel:@"styleImage"];
    uint64_t v30 = [v28 nodeWithHandle:v29];
    styleNode = v15->_styleNode;
    v15->_styleNode = (MPSNNImageNode *)v30;

    v32 = (void *)MEMORY[0x263F13380];
    v33 = [[TCMPSGraphNodeHandle alloc] initWithLabel:@"styleScaleImage"];
    uint64_t v34 = [v32 nodeWithHandle:v33];
    styleScaleNode = v15->_styleScaleNode;
    v15->_styleScaleNode = (MPSNNImageNode *)v34;

    v36 = (void *)MEMORY[0x263F13380];
    v37 = [[TCMPSGraphNodeHandle alloc] initWithLabel:@"styleMeanImage"];
    uint64_t v38 = [v36 nodeWithHandle:v37];
    styleMeanNode = v15->_styleMeanNode;
    v15->_styleMeanNode = (MPSNNImageNode *)v38;

    v177 = +[TCMPSStyleTransfer defineTransformerDescriptor:a6 tuneAllWeights:v15->_updateAllParams];
    uint64_t v40 = +[TCMPSStyleTransfer defineVGG16Descriptor:a6];
    id v178 = v13;
    v41 = [[TCMPSStyleTransferTransformerNetwork alloc] initWithParameters:@"Transformer" inputNode:v15->_contentNode device:v15->_dev cmdQueue:v15->_commandQueue descriptor:v177 initWeights:v13];
    model = v15->_model;
    v15->_model = v41;

    v43 = [[TCMPSGraphNodeHandle alloc] initWithLabel:@"TransformerForwardPass"];
    v44 = [(TCMPSStyleTransferTransformerNetwork *)v15->_model forwardPass];
    [v44 setHandle:v43];

    v45 = [(TCMPSStyleTransferTransformerNetwork *)v15->_model forwardPass];
    [v45 setExportFromGraph:1];

    v46 = [(TCMPSStyleTransferTransformerNetwork *)v15->_model forwardPass];
    [v46 setSynchronizeResource:1];

    v47 = [MEMORY[0x263F13220] defaultAllocator];
    v48 = [(TCMPSStyleTransferTransformerNetwork *)v15->_model forwardPass];
    [v48 setImageAllocator:v47];

    v49 = [TCMPSStyleTransferPreProcessing alloc];
    v50 = [(TCMPSStyleTransferTransformerNetwork *)v15->_model forwardPass];
    uint64_t v51 = [(TCMPSStyleTransferPreProcessing *)v49 initWithParameters:@"Content_Pre_Processing" inputNode:v50 scaleNode:v15->_contentScaleNode meanNode:v15->_contenMeanNode];
    contentPreProcess = v15->_contentPreProcess;
    v15->_contentPreProcess = (TCMPSStyleTransferPreProcessing *)v51;

    v53 = [TCMPSVgg16Network alloc];
    v54 = [(TCMPSStyleTransferPreProcessing *)v15->_contentPreProcess output];
    uint64_t v55 = [(TCMPSVgg16Network *)v53 initWithParameters:@"Content_VGG_16" inputNode:v54 device:v15->_dev cmdQueue:v15->_commandQueue descriptor:v40 initWeights:v13];
    contentVgg = v15->_contentVgg;
    v15->_contentVgg = (TCMPSVgg16Network *)v55;

    v57 = [[TCMPSStyleTransferPreProcessing alloc] initWithParameters:@"Style_Pre_Processing" inputNode:v15->_styleNode scaleNode:v15->_styleScaleNode meanNode:v15->_styleMeanNode];
    stylePreProcessLoss = v15->_stylePreProcessLoss;
    v15->_stylePreProcessLoss = v57;

    v59 = [TCMPSVgg16Network alloc];
    v60 = [(TCMPSStyleTransferPreProcessing *)v15->_stylePreProcessLoss output];
    v176 = (void *)v40;
    uint64_t v61 = [(TCMPSVgg16Network *)v59 initWithParameters:@"Style_VGG_16" inputNode:v60 device:v15->_dev cmdQueue:v15->_commandQueue descriptor:v40 initWeights:v13];
    styleVggLoss = v15->_styleVggLoss;
    v15->_styleVggLoss = (TCMPSVgg16Network *)v61;

    v63 = [[TCMPSStyleTransferPreProcessing alloc] initWithParameters:@"Content_Loss_Pre_Processing" inputNode:v15->_contentNode scaleNode:v15->_contentScaleNode meanNode:v15->_contenMeanNode];
    contentPreProcessLoss = v15->_contentPreProcessLoss;
    v15->_contentPreProcessLoss = v63;

    v65 = [TCMPSVgg16Network alloc];
    v66 = [(TCMPSStyleTransferPreProcessing *)v15->_contentPreProcessLoss output];
    uint64_t v67 = [(TCMPSVgg16Network *)v65 initWithParameters:@"Content_Loss_VGG_16" inputNode:v66 device:v15->_dev cmdQueue:v15->_commandQueue descriptor:v40 initWeights:v13];
    contentVggLoss = v15->_contentVggLoss;
    v15->_contentVggLoss = (TCMPSVgg16Network *)v67;

    v69 = [MEMORY[0x263F13168] cnnLossDescriptorWithType:1 reductionType:2];
    double v70 = v15->_styleLossMultiplier * 0.5 * v15->_totalLossMultiplier;
    *(float *)&double v70 = v70;
    v71 = v69;
    [v69 setWeight:v70];
    v184 = [MEMORY[0x263F13168] cnnLossDescriptorWithType:1 reductionType:2];
    double v72 = v15->_contentLossMultiplier * 0.5 * v15->_totalLossMultiplier;
    *(float *)&double v72 = v72;
    [v184 setWeight:v72];
    id v180 = v11;
    v73 = (void *)MEMORY[0x263F13370];
    v74 = [(TCMPSVgg16Network *)v15->_styleVggLoss reluOut1];
    LODWORD(v75) = 931135488;
    v174 = [v73 nodeWithSource:v74 alpha:v75];

    v76 = (void *)MEMORY[0x263F13370];
    v77 = [(TCMPSVgg16Network *)v15->_contentVgg reluOut1];
    LODWORD(v78) = 931135488;
    v175 = [v76 nodeWithSource:v77 alpha:v78];

    v79 = (void *)MEMORY[0x263F13368];
    v80 = [v175 resultImage];
    v81 = [v174 resultImage];
    v183 = [v79 nodeWithSource:v80 labels:v81 lossDescriptor:v71];

    v82 = (void *)MEMORY[0x263F13370];
    v83 = [(TCMPSVgg16Network *)v15->_styleVggLoss reluOut2];
    LODWORD(v84) = 947912704;
    v172 = [v82 nodeWithSource:v83 alpha:v84];

    v85 = (void *)MEMORY[0x263F13370];
    v86 = [(TCMPSVgg16Network *)v15->_contentVgg reluOut2];
    LODWORD(v87) = 947912704;
    v173 = [v85 nodeWithSource:v86 alpha:v87];

    v88 = (void *)MEMORY[0x263F13368];
    v89 = [v173 resultImage];
    v90 = [v172 resultImage];
    v166 = [v88 nodeWithSource:v89 labels:v90 lossDescriptor:v71];

    v91 = (void *)MEMORY[0x263F13370];
    v92 = [(TCMPSVgg16Network *)v15->_styleVggLoss reluOut3];
    LODWORD(v93) = 964689920;
    v170 = [v91 nodeWithSource:v92 alpha:v93];

    v94 = (void *)MEMORY[0x263F13370];
    v95 = [(TCMPSVgg16Network *)v15->_contentVgg reluOut3];
    LODWORD(v96) = 964689920;
    v171 = [v94 nodeWithSource:v95 alpha:v96];

    v97 = (void *)MEMORY[0x263F13368];
    v98 = [v171 resultImage];
    v99 = [v170 resultImage];
    v169 = v71;
    v182 = [v97 nodeWithSource:v98 labels:v99 lossDescriptor:v71];

    v100 = (void *)MEMORY[0x263F13370];
    v101 = [(TCMPSVgg16Network *)v15->_styleVggLoss reluOut4];
    LODWORD(v102) = 981467136;
    v167 = [v100 nodeWithSource:v101 alpha:v102];

    v103 = (void *)MEMORY[0x263F13370];
    v104 = [(TCMPSVgg16Network *)v15->_contentVgg reluOut4];
    LODWORD(v105) = 981467136;
    v168 = [v103 nodeWithSource:v104 alpha:v105];

    v106 = (void *)MEMORY[0x263F13368];
    v107 = [v168 resultImage];
    v108 = [v167 resultImage];
    v165 = [v106 nodeWithSource:v107 labels:v108 lossDescriptor:v71];

    v109 = (void *)MEMORY[0x263F13368];
    v110 = [(TCMPSVgg16Network *)v15->_contentVgg reluOut3];
    v111 = [(TCMPSVgg16Network *)v15->_contentVggLoss reluOut3];
    v181 = [v109 nodeWithSource:v110 labels:v111 lossDescriptor:v184];

    v112 = (void *)MEMORY[0x263F13358];
    v113 = [v183 resultImage];
    v191[0] = v113;
    v114 = [v166 resultImage];
    v191[1] = v114;
    v115 = [MEMORY[0x263EFF8C0] arrayWithObjects:v191 count:2];
    v164 = [v112 nodeWithSources:v115];

    v116 = (void *)MEMORY[0x263F13358];
    v117 = [v182 resultImage];
    v190[0] = v117;
    v118 = [v165 resultImage];
    v190[1] = v118;
    v119 = [MEMORY[0x263EFF8C0] arrayWithObjects:v190 count:2];
    v163 = [v116 nodeWithSources:v119];

    v120 = (void *)MEMORY[0x263F13358];
    v121 = [v164 resultImage];
    v189[0] = v121;
    v122 = [v163 resultImage];
    v189[1] = v122;
    v123 = [MEMORY[0x263EFF8C0] arrayWithObjects:v189 count:2];
    v162 = [v120 nodeWithSources:v123];

    v124 = (void *)MEMORY[0x263F13358];
    v125 = [v181 resultImage];
    v188[0] = v125;
    v126 = [v162 resultImage];
    v188[1] = v126;
    v127 = [MEMORY[0x263EFF8C0] arrayWithObjects:v188 count:2];
    v128 = [v124 nodeWithSources:v127];

    v129 = [[TCMPSGraphNodeHandle alloc] initWithLabel:@"totalLossValue"];
    v130 = [v128 resultImage];
    [v130 setHandle:v129];

    v131 = [v128 resultImage];
    [v131 setExportFromGraph:1];

    v132 = [v128 resultImage];
    [v132 setSynchronizeResource:1];

    v133 = [MEMORY[0x263F13220] defaultAllocator];
    v161 = v128;
    v134 = [v128 resultImage];
    [v134 setImageAllocator:v133];

    v135 = (void *)MEMORY[0x263F13388];
    v136 = [v128 resultImage];
    v137 = [v135 nodeWithSource:v136];

    __int16 v185 = 257;
    v138 = v137;
    v160 = v137;
    v139 = [v137 resultImage];
    v140 = [v138 trainingGraphWithSourceGradient:v139 nodeHandler:0];

    dev = v15->_dev;
    v158 = (void *)MEMORY[0x263F13378];
    v159 = [v140 objectAtIndexedSubscript:0];
    v141 = [v159 resultImage];
    v187[0] = v141;
    v142 = [v140 objectAtIndexedSubscript:1];
    v143 = [v142 resultImage];
    v187[1] = v143;
    v144 = [v140 objectAtIndexedSubscript:2];
    v145 = [v144 resultImage];
    v187[2] = v145;
    v146 = [v140 objectAtIndexedSubscript:3];
    v147 = [v146 resultImage];
    v187[3] = v147;
    v148 = [MEMORY[0x263EFF8C0] arrayWithObjects:v187 count:4];
    uint64_t v149 = [v158 graphWithDevice:dev resultImages:v148 resultsAreNeeded:&v185];
    trainingGraph = v15->_trainingGraph;
    v15->_trainingGraph = (MPSNNGraph *)v149;

    id v13 = v178;
    id v12 = v179;

    id v11 = v180;
    v151 = (void *)MEMORY[0x263F13378];
    v152 = v15->_dev;
    v153 = [(TCMPSStyleTransferTransformerNetwork *)v15->_model forwardPass];
    uint64_t v154 = [v151 graphWithDevice:v152 resultImage:v153 resultImageIsNeeded:1];
    inferenceGraph = v15->_inferenceGraph;
    v15->_inferenceGraph = (MPSNNGraph *)v154;

    [(MPSNNGraph *)v15->_trainingGraph setFormat:4];
    [(MPSNNGraph *)v15->_inferenceGraph setFormat:4];
  }
  return v15;
}

+ (id)topLeftCropImage:(id)a3 inputHeight:(unint64_t)a4 inputWidth:(unint64_t)a5 outputHeight:(unint64_t)a6 outputWidth:(unint64_t)a7 numChannels:(unint64_t)a8
{
  id v12 = a3;
  unint64_t v13 = 4 * a8 * a7;
  int v14 = [MEMORY[0x263EFF990] dataWithLength:v13 * a6];
  if (a6)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = 4 * a8 * a5;
    do
    {
      objc_msgSend(v12, "getBytes:range:", objc_msgSend(v14, "mutableBytes") + v16, v15, v13);
      v16 += v13;
      v15 += v17;
      --a6;
    }
    while (a6);
  }

  return v14;
}

- (id)exportWeights
{
  [(TCMPSStyleTransfer *)self checkpoint];
  model = self->_model;
  return [(TCMPSStyleTransferTransformerNetwork *)model exportWeights:@"transformer_"];
}

- (id)predict:(id)a3
{
  v54[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_batchSize = 1;
  [v4 objectForKeyedSubscript:@"width"];
  v41 = float v49 = 0.0;
  [v41 getBytes:&v49 length:4];
  self->_imgWidth = (uint64_t)v49;
  [v4 objectForKeyedSubscript:@"height"];
  uint64_t v40 = v48 = 0.0;
  [v40 getBytes:&v48 length:4];
  self->_imgHeight = (uint64_t)v48;
  float v47 = 0.0;
  unint64_t v5 = [v4 objectForKeyedSubscript:@"index"];
  [v5 getBytes:&v47 length:4];

  [(TCMPSStyleTransferTransformerNetwork *)self->_model setStyleIndex:(unint64_t)v47];
  [(MPSNNGraph *)self->_inferenceGraph reloadFromDataSources];
  unint64_t v6 = [MEMORY[0x263F13278] imageDescriptorWithChannelFormat:4 width:self->_imgWidth height:self->_imgHeight featureChannels:3 numberOfImages:1 usage:3];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_batchSize)
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x263F13220]) initWithDevice:self->_dev imageDescriptor:v6];
      id v10 = [v4 objectForKeyedSubscript:@"input"];
      objc_msgSend(v9, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v10, "bytes"), 0, 0);

      [v7 addObject:v9];
      ++v8;
    }
    while (v8 < self->_batchSize);
  }
  uint64_t v11 = [v7 copy];
  id v12 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  inferenceGraph = self->_inferenceGraph;
  v39 = (void *)v11;
  v54[0] = v11;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:1];
  v37 = v14;
  uint64_t v38 = v13;
  unint64_t v17 = [(MPSNNGraph *)inferenceGraph encodeBatchToCommandBuffer:v12 sourceImages:v16 sourceStates:0 intermediateImages:v13 destinationStates:v14];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * i) synchronizeOnCommandBuffer:v12];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v20);
  }

  [v12 commit];
  [v12 waitUntilCompleted];
  v42 = objc_alloc_init(TCMPSStyleTransferWeights);
  v23 = [v18 firstObject];
  uint64_t v24 = [v23 width];
  uint64_t v25 = [v23 height];
  v36 = v23;
  uint64_t v33 = [v23 featureChannels];
  id v35 = [MEMORY[0x263EFF990] dataWithLength:4 * v24 * v25 * v33];
  objc_msgSend(v23, "readBytes:dataLayout:imageIndex:", objc_msgSend(v35, "mutableBytes"), 0, 0);
  uint64_t v26 = +[TCMPSStyleTransfer topLeftCropImage:v35 inputHeight:v25 inputWidth:v24 outputHeight:self->_imgHeight outputWidth:self->_imgWidth numChannels:v33];
  [(TCMPSStyleTransferWeights *)v42 setData:v26];

  uint64_t v34 = [NSNumber numberWithUnsignedInteger:self->_batchSize];
  v52[0] = v34;
  v27 = [NSNumber numberWithUnsignedInteger:self->_imgHeight];
  v52[1] = v27;
  v28 = [NSNumber numberWithUnsignedInteger:self->_imgWidth];
  v52[2] = v28;
  v29 = [NSNumber numberWithUnsignedInteger:v33];
  v52[3] = v29;
  uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:4];
  [(TCMPSStyleTransferWeights *)v42 setShape:v30];

  v50 = @"output";
  uint64_t v51 = v42;
  v31 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];

  return v31;
}

- (void)setLearningRate:(float)a3
{
  -[TCMPSStyleTransferTransformerNetwork setLearningRate:](self->_model, "setLearningRate:");
  *(float *)&double v5 = a3;
  [(TCMPSVgg16Network *)self->_contentVgg setLearningRate:v5];
  *(float *)&double v6 = a3;
  [(TCMPSVgg16Network *)self->_styleVggLoss setLearningRate:v6];
  contentVggLoss = self->_contentVggLoss;
  *(float *)&double v8 = a3;
  [(TCMPSVgg16Network *)contentVggLoss setLearningRate:v8];
}

- (id)train:(id)a3
{
  v89[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_batchSize = 1;
  [v4 objectForKeyedSubscript:@"width"];
  v62 = float v84 = 0.0;
  [v62 getBytes:&v84 length:4];
  self->_imgWidth = (uint64_t)v84;
  [v4 objectForKeyedSubscript:@"height"];
  uint64_t v61 = v83 = 0.0;
  [v61 getBytes:&v83 length:4];
  self->_imgHeight = (uint64_t)v83;
  float v82 = 0.0;
  double v5 = [v4 objectForKeyedSubscript:@"index"];
  [v5 getBytes:&v82 length:4];

  [(TCMPSStyleTransferTransformerNetwork *)self->_model setStyleIndex:(unint64_t)v82];
  unint64_t v6 = 12 * self->_imgWidth * self->_imgHeight;
  id v7 = [MEMORY[0x263EFF990] dataWithLength:v6];
  uint64_t v8 = [MEMORY[0x263EFF990] dataWithLength:v6];
  uint64_t v9 = [MEMORY[0x263F13278] imageDescriptorWithChannelFormat:4 width:self->_imgWidth height:self->_imgHeight featureChannels:3 numberOfImages:1 usage:3];
  +[TCMPSStyleTransfer populateMean:v7];
  id v63 = (id)v8;
  +[TCMPSStyleTransfer populateMultiplication:v8];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v70 = objc_alloc_init(MEMORY[0x263EFF980]);
  v71 = self;
  v66 = v10;
  uint64_t v67 = v7;
  double v72 = (void *)v9;
  v64 = v12;
  v65 = v11;
  if (self->_batchSize)
  {
    unint64_t v13 = 0;
    do
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x263F13220]) initWithDevice:self->_dev imageDescriptor:v9];
      id v15 = [v4 objectForKeyedSubscript:@"input"];
      objc_msgSend(v14, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v15, "bytes"), 0, 0);

      [v10 addObject:v14];
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F13220]) initWithDevice:self->_dev imageDescriptor:v72];
      id v17 = v7;
      objc_msgSend(v16, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v17, "bytes"), 0, 0);
      [v11 addObject:v16];
      id v18 = (void *)[objc_alloc(MEMORY[0x263F13220]) initWithDevice:v71->_dev imageDescriptor:v72];
      id v19 = v63;
      objc_msgSend(v18, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v19, "bytes"), 0, 0);
      [v12 addObject:v18];
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F13220]) initWithDevice:v71->_dev imageDescriptor:v72];
      id v21 = [v4 objectForKeyedSubscript:@"labels"];
      objc_msgSend(v20, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v21, "bytes"), 0, 0);

      [v69 addObject:v20];
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F13220]) initWithDevice:v71->_dev imageDescriptor:v72];
      objc_msgSend(v22, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v17, "bytes"), 0, 0);
      [v68 addObject:v22];
      v23 = (void *)[objc_alloc(MEMORY[0x263F13220]) initWithDevice:v71->_dev imageDescriptor:v72];
      uint64_t v24 = v19;
      id v11 = v65;
      objc_msgSend(v23, "writeBytes:dataLayout:imageIndex:", objc_msgSend(v24, "bytes"), 0, 0);
      [v70 addObject:v23];

      id v7 = v67;
      id v12 = v64;

      id v10 = v66;
      self = v71;

      uint64_t v9 = (uint64_t)v72;
      ++v13;
    }
    while (v13 < v71->_batchSize);
  }
  uint64_t v55 = v4;
  uint64_t v25 = [v10 copy];
  uint64_t v26 = [v11 copy];
  uint64_t v27 = [v12 copy];
  uint64_t v28 = [v69 copy];
  v29 = (void *)[v68 copy];
  uint64_t v30 = [v70 copy];
  v31 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  v32 = self;
  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  trainingGraph = v32->_trainingGraph;
  v59 = (void *)v26;
  v60 = (void *)v25;
  v89[0] = v25;
  v89[1] = v27;
  v57 = (void *)v28;
  v58 = (void *)v27;
  v89[2] = v26;
  v89[3] = v28;
  v56 = (void *)v30;
  v89[4] = v30;
  v89[5] = v29;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:6];
  v54 = v34;
  v37 = [(MPSNNGraph *)trainingGraph encodeBatchToCommandBuffer:v31 sourceImages:v36 sourceStates:0 intermediateImages:v33 destinationStates:v34];

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v38 = v37;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v78 objects:v88 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v79 != v41) {
          objc_enumerationMutation(v38);
        }
        [*(id *)(*((void *)&v78 + 1) + 8 * i) synchronizeOnCommandBuffer:v31];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v78 objects:v88 count:16];
    }
    while (v40);
  }

  [v31 commit];
  [v31 waitUntilCompleted];
  long long v43 = [v33 objectAtIndex:0];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v73 objects:v87 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v74;
    float v47 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v74 != v46) {
          objc_enumerationMutation(v43);
        }
        float v49 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        float v77 = 0.0;
        [v49 readBytes:&v77 dataLayout:0 imageIndex:0];
        float v47 = v77 + v47;
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v73 objects:v87 count:16];
    }
    while (v45);
  }
  else
  {
    float v47 = 0.0;
  }
  float v77 = v47 / (float)v71->_batchSize;
  v50 = [MEMORY[0x263EFF990] data];
  [v50 appendBytes:&v77 length:4];
  uint64_t v51 = objc_alloc_init(TCMPSStyleTransferWeights);
  [(TCMPSStyleTransferWeights *)v51 setData:v50];
  [(TCMPSStyleTransferWeights *)v51 setShape:&unk_26D796800];
  v85 = @"loss";
  v86 = v51;
  v52 = [NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];

  return v52;
}

- (void)checkpoint
{
  v3 = (void *)MEMORY[0x263F13378];
  dev = self->_dev;
  double v5 = [(TCMPSStyleTransferTransformerNetwork *)self->_model forwardPass];
  unint64_t v6 = [v3 graphWithDevice:dev resultImage:v5 resultImageIsNeeded:1];
  inferenceGraph = self->_inferenceGraph;
  self->_inferenceGraph = v6;

  uint64_t v8 = self->_inferenceGraph;
  [(MPSNNGraph *)v8 setFormat:4];
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (float)contentLossMultiplier
{
  return self->_contentLossMultiplier;
}

- (void)setContentLossMultiplier:(float)a3
{
  self->_contentLossMultiplier = a3;
}

- (float)styleLossMultiplier
{
  return self->_styleLossMultiplier;
}

- (void)setStyleLossMultiplier:(float)a3
{
  self->_styleLossMultiplier = a3;
}

- (float)totalLossMultiplier
{
  return self->_totalLossMultiplier;
}

- (void)setTotalLossMultiplier:(float)a3
{
  self->_totalLossMultiplier = a3;
}

- (BOOL)updateAllParams
{
  return self->_updateAllParams;
}

- (void)setUpdateAllParams:(BOOL)a3
{
  self->_updateAllParams = a3;
}

- (unint64_t)imgWidth
{
  return self->_imgWidth;
}

- (void)setImgWidth:(unint64_t)a3
{
  self->_imgWidth = a3;
}

- (unint64_t)imgHeight
{
  return self->_imgHeight;
}

- (void)setImgHeight:(unint64_t)a3
{
  self->_imgHeight = a3;
}

- (TCMPSStyleTransferTransformerNetwork)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (TCMPSStyleTransferPreProcessing)contentPreProcess
{
  return self->_contentPreProcess;
}

- (void)setContentPreProcess:(id)a3
{
}

- (TCMPSStyleTransferPreProcessing)stylePreProcessLoss
{
  return self->_stylePreProcessLoss;
}

- (void)setStylePreProcessLoss:(id)a3
{
}

- (TCMPSStyleTransferPreProcessing)contentPreProcessLoss
{
  return self->_contentPreProcessLoss;
}

- (void)setContentPreProcessLoss:(id)a3
{
}

- (TCMPSVgg16Network)contentVgg
{
  return self->_contentVgg;
}

- (void)setContentVgg:(id)a3
{
}

- (TCMPSVgg16Network)styleVggLoss
{
  return self->_styleVggLoss;
}

- (void)setStyleVggLoss:(id)a3
{
}

- (TCMPSVgg16Network)contentVggLoss
{
  return self->_contentVggLoss;
}

- (void)setContentVggLoss:(id)a3
{
}

- (MPSNNImageNode)contentNode
{
  return self->_contentNode;
}

- (void)setContentNode:(id)a3
{
}

- (MPSNNImageNode)contentScaleNode
{
  return self->_contentScaleNode;
}

- (void)setContentScaleNode:(id)a3
{
}

- (MPSNNImageNode)contenMeanNode
{
  return self->_contenMeanNode;
}

- (void)setContenMeanNode:(id)a3
{
}

- (MPSNNImageNode)styleNode
{
  return self->_styleNode;
}

- (void)setStyleNode:(id)a3
{
}

- (MPSNNImageNode)styleScaleNode
{
  return self->_styleScaleNode;
}

- (void)setStyleScaleNode:(id)a3
{
}

- (MPSNNImageNode)styleMeanNode
{
  return self->_styleMeanNode;
}

- (void)setStyleMeanNode:(id)a3
{
}

- (MPSNNGraph)trainingGraph
{
  return self->_trainingGraph;
}

- (void)setTrainingGraph:(id)a3
{
}

- (MPSNNGraph)inferenceGraph
{
  return self->_inferenceGraph;
}

- (void)setInferenceGraph:(id)a3
{
}

- (MTLDevice)dev
{
  return self->_dev;
}

- (void)setDev:(id)a3
{
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)setCommandQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_dev, 0);
  objc_storeStrong((id *)&self->_inferenceGraph, 0);
  objc_storeStrong((id *)&self->_trainingGraph, 0);
  objc_storeStrong((id *)&self->_styleMeanNode, 0);
  objc_storeStrong((id *)&self->_styleScaleNode, 0);
  objc_storeStrong((id *)&self->_styleNode, 0);
  objc_storeStrong((id *)&self->_contenMeanNode, 0);
  objc_storeStrong((id *)&self->_contentScaleNode, 0);
  objc_storeStrong((id *)&self->_contentNode, 0);
  objc_storeStrong((id *)&self->_contentVggLoss, 0);
  objc_storeStrong((id *)&self->_styleVggLoss, 0);
  objc_storeStrong((id *)&self->_contentVgg, 0);
  objc_storeStrong((id *)&self->_contentPreProcessLoss, 0);
  objc_storeStrong((id *)&self->_stylePreProcessLoss, 0);
  objc_storeStrong((id *)&self->_contentPreProcess, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end