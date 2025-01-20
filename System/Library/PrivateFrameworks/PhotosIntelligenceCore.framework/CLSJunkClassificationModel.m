@interface CLSJunkClassificationModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (CLSJunkClassificationModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)badFramingNode;
- (CLSSignalNode)badLightingNode;
- (CLSSignalNode)blurryNode;
- (CLSSignalNode)foodOrDrinkNode;
- (CLSSignalNode)legacyNode;
- (CLSSignalNode)medicalReferenceNode;
- (CLSSignalNode)negativeInternalNode;
- (CLSSignalNode)negativeNode;
- (CLSSignalNode)nonMemorableNode;
- (CLSSignalNode)otherNode;
- (CLSSignalNode)poorQualityNode;
- (CLSSignalNode)receiptOrDocumentNode;
- (CLSSignalNode)repairReferenceNode;
- (CLSSignalNode)screenshotNode;
- (CLSSignalNode)shoppingReferenceNode;
- (CLSSignalNode)textDocumentNode;
- (CLSSignalNode)tragicFailureInternalNode;
- (CLSSignalNode)tragicFailureNode;
- (CLSSignalNode)utilityReferenceNode;
- (id)initForTesting;
- (id)modelInfo;
- (id)nodeForSignalIdentifier:(unint64_t)a3;
- (unint64_t)version;
- (void)setupVersion31;
- (void)setupVersion32;
- (void)setupVersion40;
- (void)setupVersion81;
- (void)setupVersion86;
@end

@implementation CLSJunkClassificationModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyNode, 0);
  objc_storeStrong((id *)&self->_utilityReferenceNode, 0);
  objc_storeStrong((id *)&self->_shoppingReferenceNode, 0);
  objc_storeStrong((id *)&self->_repairReferenceNode, 0);
  objc_storeStrong((id *)&self->_receiptOrDocumentNode, 0);
  objc_storeStrong((id *)&self->_negativeInternalNode, 0);
  objc_storeStrong((id *)&self->_medicalReferenceNode, 0);
  objc_storeStrong((id *)&self->_otherNode, 0);
  objc_storeStrong((id *)&self->_foodOrDrinkNode, 0);
  objc_storeStrong((id *)&self->_blurryNode, 0);
  objc_storeStrong((id *)&self->_badLightingNode, 0);
  objc_storeStrong((id *)&self->_badFramingNode, 0);
  objc_storeStrong((id *)&self->_screenshotNode, 0);
  objc_storeStrong((id *)&self->_tragicFailureInternalNode, 0);
  objc_storeStrong((id *)&self->_tragicFailureNode, 0);
  objc_storeStrong((id *)&self->_textDocumentNode, 0);
  objc_storeStrong((id *)&self->_poorQualityNode, 0);
  objc_storeStrong((id *)&self->_nonMemorableNode, 0);
  objc_storeStrong((id *)&self->_negativeNode, 0);
}

- (CLSSignalNode)legacyNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 160, 1);
}

- (CLSSignalNode)utilityReferenceNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 152, 1);
}

- (CLSSignalNode)shoppingReferenceNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 144, 1);
}

- (CLSSignalNode)repairReferenceNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 136, 1);
}

- (CLSSignalNode)receiptOrDocumentNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 128, 1);
}

- (CLSSignalNode)negativeInternalNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 120, 1);
}

- (CLSSignalNode)medicalReferenceNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 112, 1);
}

- (CLSSignalNode)otherNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 104, 1);
}

- (CLSSignalNode)foodOrDrinkNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 96, 1);
}

- (CLSSignalNode)blurryNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 88, 1);
}

- (CLSSignalNode)badLightingNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 80, 1);
}

- (CLSSignalNode)badFramingNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 72, 1);
}

- (CLSSignalNode)screenshotNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)tragicFailureInternalNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)tragicFailureNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)textDocumentNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)poorQualityNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)nonMemorableNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)negativeNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (id)modelInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__CLSJunkClassificationModel_modelInfo__block_invoke;
  v8[3] = &unk_265454170;
  id v4 = v3;
  id v9 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x25A2E1E50](v8);
  ((void (**)(void, CLSSignalNode *, uint64_t))v5)[2](v5, self->_negativeNode, 1);
  ((void (**)(void, CLSSignalNode *, uint64_t))v5)[2](v5, self->_nonMemorableNode, 1);
  ((void (**)(void, CLSSignalNode *, uint64_t))v5)[2](v5, self->_poorQualityNode, 1);
  ((void (**)(void, CLSSignalNode *, uint64_t))v5)[2](v5, self->_textDocumentNode, 1);
  ((void (**)(void, CLSSignalNode *, uint64_t))v5)[2](v5, self->_tragicFailureNode, 1);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_tragicFailureInternalNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_screenshotNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_badFramingNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_badLightingNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_blurryNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_foodOrDrinkNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_otherNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_medicalReferenceNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_negativeInternalNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_receiptOrDocumentNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_repairReferenceNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_shoppingReferenceNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_utilityReferenceNode, 0);
  id v6 = v4;

  return v6;
}

void __39__CLSJunkClassificationModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (~a3 & 0x7FFFFF00) == 0;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  switch((int)a3)
  {
    case 0x7FFFFFED:
      textDocumentNode = self->_textDocumentNode;
      goto LABEL_21;
    case 0x7FFFFFEE:
      textDocumentNode = self->_tragicFailureInternalNode;
      goto LABEL_21;
    case 0x7FFFFFEF:
      textDocumentNode = self->_tragicFailureNode;
      goto LABEL_21;
    case 0x7FFFFFF0:
      textDocumentNode = self->_screenshotNode;
      goto LABEL_21;
    case 0x7FFFFFF1:
      textDocumentNode = self->_badFramingNode;
      goto LABEL_21;
    case 0x7FFFFFF2:
      textDocumentNode = self->_badLightingNode;
      goto LABEL_21;
    case 0x7FFFFFF3:
      textDocumentNode = self->_blurryNode;
      goto LABEL_21;
    case 0x7FFFFFF4:
      textDocumentNode = self->_foodOrDrinkNode;
      goto LABEL_21;
    case 0x7FFFFFF5:
      textDocumentNode = self->_otherNode;
      goto LABEL_21;
    case 0x7FFFFFF6:
      textDocumentNode = self->_medicalReferenceNode;
      goto LABEL_21;
    case 0x7FFFFFF7:
      textDocumentNode = self->_negativeInternalNode;
      goto LABEL_21;
    case 0x7FFFFFF8:
      textDocumentNode = self->_receiptOrDocumentNode;
      goto LABEL_21;
    case 0x7FFFFFF9:
      textDocumentNode = self->_repairReferenceNode;
      goto LABEL_21;
    case 0x7FFFFFFA:
      textDocumentNode = self->_shoppingReferenceNode;
      goto LABEL_21;
    case 0x7FFFFFFB:
      textDocumentNode = self->_utilityReferenceNode;
      goto LABEL_21;
    case 0x7FFFFFFC:
      textDocumentNode = self->_negativeNode;
      goto LABEL_21;
    case 0x7FFFFFFD:
      textDocumentNode = self->_nonMemorableNode;
      goto LABEL_21;
    case 0x7FFFFFFE:
      textDocumentNode = self->_poorQualityNode;
      goto LABEL_21;
    case 0x7FFFFFFF:
      textDocumentNode = self->_legacyNode;
LABEL_21:
      v5 = textDocumentNode;
      break;
    default:
      if ([(CLSJunkClassificationModel *)self isResponsibleForSignalIdentifier:a3])
      {
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"Junk - Unknown (%X)", a3);
        v5 = [[CLSSignalNode alloc] initWithIdentifier:a3 name:v7 operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
      }
      else
      {
        v5 = 0;
      }
      break;
  }
  return v5;
}

- (void)setupVersion86
{
  self->_version = 86;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147483644 name:@"Junk - Negative" operatingPoint:0.1 highPrecisionOperatingPoint:0.31 highRecallOperatingPoint:0.06];
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147483645 name:@"Junk - Non Memorable" operatingPoint:0.44 highPrecisionOperatingPoint:0.55 highRecallOperatingPoint:0.32];
  nonMemorableNode = self->_nonMemorableNode;
  self->_nonMemorableNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147483646 name:@"Junk - Poor Quality" operatingPoint:0.54 highPrecisionOperatingPoint:0.83 highRecallOperatingPoint:0.21];
  poorQualityNode = self->_poorQualityNode;
  self->_poorQualityNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147483629 name:@"Junk - Text Document" operatingPoint:0.58 highPrecisionOperatingPoint:0.59 highRecallOperatingPoint:0.34];
  textDocumentNode = self->_textDocumentNode;
  self->_textDocumentNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147483631 name:@"Junk - Tragic Failure" operatingPoint:0.15 highPrecisionOperatingPoint:0.37 highRecallOperatingPoint:0.11];
  tragicFailureNode = self->_tragicFailureNode;
  self->_tragicFailureNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147483630 name:@"Junk - Tragic Failure Internal" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  tragicFailureInternalNode = self->_tragicFailureInternalNode;
  self->_tragicFailureInternalNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147483632 name:@"Junk - Screenshot" operatingPoint:0.47 highPrecisionOperatingPoint:0.58 highRecallOperatingPoint:0.18];
  screenshotNode = self->_screenshotNode;
  self->_screenshotNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147483633 name:@"Junk - Bad Framing" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  badFramingNode = self->_badFramingNode;
  self->_badFramingNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:2147483634 name:@"Junk - Bad Lighting" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  badLightingNode = self->_badLightingNode;
  self->_badLightingNode = v19;

  v21 = [[CLSSignalNode alloc] initWithIdentifier:2147483635 name:@"Junk - Blurry" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  blurryNode = self->_blurryNode;
  self->_blurryNode = v21;

  v23 = [[CLSSignalNode alloc] initWithIdentifier:2147483636 name:@"Junk - Food or Drink" operatingPoint:0.3 highPrecisionOperatingPoint:0.5 highRecallOperatingPoint:0.15];
  foodOrDrinkNode = self->_foodOrDrinkNode;
  self->_foodOrDrinkNode = v23;

  v25 = [[CLSSignalNode alloc] initWithIdentifier:2147483637 name:@"Junk - Other" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  otherNode = self->_otherNode;
  self->_otherNode = v25;

  v27 = [[CLSSignalNode alloc] initWithIdentifier:2147483638 name:@"Junk - Medical Reference" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  medicalReferenceNode = self->_medicalReferenceNode;
  self->_medicalReferenceNode = v27;

  v29 = [[CLSSignalNode alloc] initWithIdentifier:2147483639 name:@"Junk - Negative Internal" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  negativeInternalNode = self->_negativeInternalNode;
  self->_negativeInternalNode = v29;

  v31 = [[CLSSignalNode alloc] initWithIdentifier:2147483640 name:@"Junk - Receipt or Document" operatingPoint:0.44 highPrecisionOperatingPoint:0.58 highRecallOperatingPoint:0.4];
  receiptOrDocumentNode = self->_receiptOrDocumentNode;
  self->_receiptOrDocumentNode = v31;

  v33 = [[CLSSignalNode alloc] initWithIdentifier:2147483641 name:@"Junk - Repair Reference" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  repairReferenceNode = self->_repairReferenceNode;
  self->_repairReferenceNode = v33;

  v35 = [[CLSSignalNode alloc] initWithIdentifier:2147483642 name:@"Junk - Shopping Reference" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  shoppingReferenceNode = self->_shoppingReferenceNode;
  self->_shoppingReferenceNode = v35;

  self->_utilityReferenceNode = [[CLSSignalNode alloc] initWithIdentifier:2147483643 name:@"Junk - Utility Reference" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion81
{
  self->_version = 81;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147483644 name:@"Junk - Negative" operatingPoint:0.2 highPrecisionOperatingPoint:0.3 highRecallOperatingPoint:0.09];
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147483645 name:@"Junk - Non Memorable" operatingPoint:0.48 highPrecisionOperatingPoint:0.65 highRecallOperatingPoint:0.27];
  nonMemorableNode = self->_nonMemorableNode;
  self->_nonMemorableNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147483646 name:@"Junk - Poor Quality" operatingPoint:0.65 highPrecisionOperatingPoint:0.82 highRecallOperatingPoint:0.33];
  poorQualityNode = self->_poorQualityNode;
  self->_poorQualityNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147483629 name:@"Junk - Text Document" operatingPoint:0.57 highPrecisionOperatingPoint:0.77 highRecallOperatingPoint:0.3];
  textDocumentNode = self->_textDocumentNode;
  self->_textDocumentNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147483631 name:@"Junk - Tragic Failure" operatingPoint:0.07 highPrecisionOperatingPoint:0.13 highRecallOperatingPoint:0.05];
  tragicFailureNode = self->_tragicFailureNode;
  self->_tragicFailureNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147483630 name:@"Junk - Tragic Failure Internal" operatingPoint:0.07 highPrecisionOperatingPoint:0.13 highRecallOperatingPoint:0.05];
  tragicFailureInternalNode = self->_tragicFailureInternalNode;
  self->_tragicFailureInternalNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147483632 name:@"Junk - Screenshot" operatingPoint:0.38 highPrecisionOperatingPoint:0.62 highRecallOperatingPoint:0.33];
  screenshotNode = self->_screenshotNode;
  self->_screenshotNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147483633 name:@"Junk - Bad Framing" operatingPoint:0.15 highPrecisionOperatingPoint:0.34 highRecallOperatingPoint:0.1];
  badFramingNode = self->_badFramingNode;
  self->_badFramingNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:2147483634 name:@"Junk - Bad Lighting" operatingPoint:0.16 highPrecisionOperatingPoint:0.61 highRecallOperatingPoint:0.08];
  badLightingNode = self->_badLightingNode;
  self->_badLightingNode = v19;

  v21 = [[CLSSignalNode alloc] initWithIdentifier:2147483635 name:@"Junk - Blurry" operatingPoint:0.22 highPrecisionOperatingPoint:0.51 highRecallOperatingPoint:0.2];
  blurryNode = self->_blurryNode;
  self->_blurryNode = v21;

  v23 = [[CLSSignalNode alloc] initWithIdentifier:2147483636 name:@"Junk - Food or Drink" operatingPoint:0.25 highPrecisionOperatingPoint:0.42 highRecallOperatingPoint:0.12];
  foodOrDrinkNode = self->_foodOrDrinkNode;
  self->_foodOrDrinkNode = v23;

  v25 = [[CLSSignalNode alloc] initWithIdentifier:2147483637 name:@"Junk - Other" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  otherNode = self->_otherNode;
  self->_otherNode = v25;

  v27 = [[CLSSignalNode alloc] initWithIdentifier:2147483638 name:@"Junk - Medical Reference" operatingPoint:0.14 highPrecisionOperatingPoint:0.32 highRecallOperatingPoint:0.08];
  medicalReferenceNode = self->_medicalReferenceNode;
  self->_medicalReferenceNode = v27;

  v29 = [[CLSSignalNode alloc] initWithIdentifier:2147483639 name:@"Junk - Negative Internal" operatingPoint:0.18 highPrecisionOperatingPoint:0.31 highRecallOperatingPoint:0.12];
  negativeInternalNode = self->_negativeInternalNode;
  self->_negativeInternalNode = v29;

  v31 = [[CLSSignalNode alloc] initWithIdentifier:2147483640 name:@"Junk - Receipt or Document" operatingPoint:0.46 highPrecisionOperatingPoint:0.67 highRecallOperatingPoint:0.22];
  receiptOrDocumentNode = self->_receiptOrDocumentNode;
  self->_receiptOrDocumentNode = v31;

  v33 = [[CLSSignalNode alloc] initWithIdentifier:2147483641 name:@"Junk - Repair Reference" operatingPoint:0.12 highPrecisionOperatingPoint:0.24 highRecallOperatingPoint:0.06];
  repairReferenceNode = self->_repairReferenceNode;
  self->_repairReferenceNode = v33;

  v35 = [[CLSSignalNode alloc] initWithIdentifier:2147483642 name:@"Junk - Shopping Reference" operatingPoint:0.26 highPrecisionOperatingPoint:0.44 highRecallOperatingPoint:0.11];
  shoppingReferenceNode = self->_shoppingReferenceNode;
  self->_shoppingReferenceNode = v35;

  self->_utilityReferenceNode = [[CLSSignalNode alloc] initWithIdentifier:2147483643 name:@"Junk - Utility Reference" operatingPoint:0.41 highPrecisionOperatingPoint:0.64 highRecallOperatingPoint:0.21];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion40
{
  self->_version = 40;
  id v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483644, @"Junk - Negative", 0.04, 0.2);
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147483645 name:@"Junk - Non Memorable" operatingPoint:0.83 highPrecisionOperatingPoint:0.94 highRecallOperatingPoint:0.58];
  nonMemorableNode = self->_nonMemorableNode;
  self->_nonMemorableNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147483646 name:@"Junk - Poor Quality" operatingPoint:0.76 highPrecisionOperatingPoint:0.85 highRecallOperatingPoint:0.26];
  poorQualityNode = self->_poorQualityNode;
  self->_poorQualityNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147483629 name:@"Junk - Text Document" operatingPoint:0.81 highPrecisionOperatingPoint:0.86 highRecallOperatingPoint:0.51];
  textDocumentNode = self->_textDocumentNode;
  self->_textDocumentNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147483631 name:@"Junk - Tragic Failure" operatingPoint:0.11 highPrecisionOperatingPoint:0.34 highRecallOperatingPoint:0.05];
  tragicFailureNode = self->_tragicFailureNode;
  self->_tragicFailureNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147483630 name:@"Junk - Tragic Failure Internal" operatingPoint:0.09 highPrecisionOperatingPoint:0.21 highRecallOperatingPoint:0.04];
  tragicFailureInternalNode = self->_tragicFailureInternalNode;
  self->_tragicFailureInternalNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147483632 name:@"Junk - Screenshot" operatingPoint:0.47 highPrecisionOperatingPoint:0.91 highRecallOperatingPoint:0.18];
  screenshotNode = self->_screenshotNode;
  self->_screenshotNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147483633 name:@"Junk - Bad Framing" operatingPoint:0.12 highPrecisionOperatingPoint:0.19 highRecallOperatingPoint:0.08];
  badFramingNode = self->_badFramingNode;
  self->_badFramingNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:2147483634 name:@"Junk - Bad Lighting" operatingPoint:0.28 highPrecisionOperatingPoint:0.56 highRecallOperatingPoint:0.14];
  badLightingNode = self->_badLightingNode;
  self->_badLightingNode = v19;

  v21 = [[CLSSignalNode alloc] initWithIdentifier:2147483635 name:@"Junk - Blurry" operatingPoint:0.41 highPrecisionOperatingPoint:0.69 highRecallOperatingPoint:0.37];
  blurryNode = self->_blurryNode;
  self->_blurryNode = v21;

  v23 = [[CLSSignalNode alloc] initWithIdentifier:2147483636 name:@"Junk - Food or Drink" operatingPoint:0.07 highPrecisionOperatingPoint:0.3 highRecallOperatingPoint:0.03];
  foodOrDrinkNode = self->_foodOrDrinkNode;
  self->_foodOrDrinkNode = v23;

  v25 = [[CLSSignalNode alloc] initWithIdentifier:2147483637 name:@"Junk - Other" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  otherNode = self->_otherNode;
  self->_otherNode = v25;

  v27 = [[CLSSignalNode alloc] initWithIdentifier:2147483638 name:@"Junk - Medical Reference" operatingPoint:0.19 highPrecisionOperatingPoint:0.25 highRecallOperatingPoint:0.07];
  medicalReferenceNode = self->_medicalReferenceNode;
  self->_medicalReferenceNode = v27;

  v29 = [[CLSSignalNode alloc] initWithIdentifier:2147483639 name:@"Junk - Negative Internal" operatingPoint:0.04 highPrecisionOperatingPoint:0.12 highRecallOperatingPoint:0.02];
  negativeInternalNode = self->_negativeInternalNode;
  self->_negativeInternalNode = v29;

  v31 = [[CLSSignalNode alloc] initWithIdentifier:2147483640 name:@"Junk - Receipt or Document" operatingPoint:0.69 highPrecisionOperatingPoint:0.8 highRecallOperatingPoint:0.3];
  receiptOrDocumentNode = self->_receiptOrDocumentNode;
  self->_receiptOrDocumentNode = v31;

  v33 = [[CLSSignalNode alloc] initWithIdentifier:2147483641 name:@"Junk - Repair Reference" operatingPoint:0.15 highPrecisionOperatingPoint:0.3 highRecallOperatingPoint:0.05];
  repairReferenceNode = self->_repairReferenceNode;
  self->_repairReferenceNode = v33;

  v35 = [[CLSSignalNode alloc] initWithIdentifier:2147483642 name:@"Junk - Shopping Reference" operatingPoint:0.52 highPrecisionOperatingPoint:0.57 highRecallOperatingPoint:0.21];
  shoppingReferenceNode = self->_shoppingReferenceNode;
  self->_shoppingReferenceNode = v35;

  self->_utilityReferenceNode = [[CLSSignalNode alloc] initWithIdentifier:2147483643 name:@"Junk - Utility Reference" operatingPoint:0.39 highPrecisionOperatingPoint:0.7 highRecallOperatingPoint:0.27];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion32
{
  [(CLSJunkClassificationModel *)self setupVersion31];
  self->_version = 32;
  self->_textDocumentNode = [[CLSSignalNode alloc] initWithIdentifier:2147483629 name:@"Junk - Text Document" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion31
{
  self->_version = 31;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147483644 name:@"Junk - Negative" operatingPoint:0.54 highPrecisionOperatingPoint:0.54 highRecallOperatingPoint:0.54];
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147483645 name:@"Junk - Non Memorable" operatingPoint:0.675 highPrecisionOperatingPoint:0.675 highRecallOperatingPoint:0.675];
  nonMemorableNode = self->_nonMemorableNode;
  self->_nonMemorableNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147483646 name:@"Junk - Poor Quality" operatingPoint:0.62 highPrecisionOperatingPoint:0.62 highRecallOperatingPoint:0.62];
  poorQualityNode = self->_poorQualityNode;
  self->_poorQualityNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:2147483629 name:@"Junk - Text Document" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  textDocumentNode = self->_textDocumentNode;
  self->_textDocumentNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:2147483631 name:@"Junk - Tragic Failure" operatingPoint:0.92 highPrecisionOperatingPoint:0.92 highRecallOperatingPoint:0.92];
  tragicFailureNode = self->_tragicFailureNode;
  self->_tragicFailureNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:2147483630 name:@"Junk - Tragic Failure Internal" operatingPoint:0.77 highPrecisionOperatingPoint:0.77 highRecallOperatingPoint:0.77];
  tragicFailureInternalNode = self->_tragicFailureInternalNode;
  self->_tragicFailureInternalNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:2147483632 name:@"Junk - Screenshot" operatingPoint:0.84 highPrecisionOperatingPoint:0.84 highRecallOperatingPoint:0.84];
  screenshotNode = self->_screenshotNode;
  self->_screenshotNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:2147483633 name:@"Junk - Bad Framing" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  badFramingNode = self->_badFramingNode;
  self->_badFramingNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:2147483634 name:@"Junk - Bad Lighting" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  badLightingNode = self->_badLightingNode;
  self->_badLightingNode = v19;

  v21 = [[CLSSignalNode alloc] initWithIdentifier:2147483635 name:@"Junk - Blurry" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  blurryNode = self->_blurryNode;
  self->_blurryNode = v21;

  v23 = [[CLSSignalNode alloc] initWithIdentifier:2147483636 name:@"Junk - Food or Drink" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  foodOrDrinkNode = self->_foodOrDrinkNode;
  self->_foodOrDrinkNode = v23;

  v25 = [[CLSSignalNode alloc] initWithIdentifier:2147483637 name:@"Junk - Other" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  otherNode = self->_otherNode;
  self->_otherNode = v25;

  v27 = [[CLSSignalNode alloc] initWithIdentifier:2147483638 name:@"Junk - Medical Reference" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  medicalReferenceNode = self->_medicalReferenceNode;
  self->_medicalReferenceNode = v27;

  v29 = [[CLSSignalNode alloc] initWithIdentifier:2147483639 name:@"Junk - Negative Internal" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  negativeInternalNode = self->_negativeInternalNode;
  self->_negativeInternalNode = v29;

  v31 = [[CLSSignalNode alloc] initWithIdentifier:2147483640 name:@"Junk - Receipt or Document" operatingPoint:0.71 highPrecisionOperatingPoint:0.71 highRecallOperatingPoint:0.71];
  receiptOrDocumentNode = self->_receiptOrDocumentNode;
  self->_receiptOrDocumentNode = v31;

  v33 = [[CLSSignalNode alloc] initWithIdentifier:2147483641 name:@"Junk - Repair Reference" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  repairReferenceNode = self->_repairReferenceNode;
  self->_repairReferenceNode = v33;

  v35 = [[CLSSignalNode alloc] initWithIdentifier:2147483642 name:@"Junk - Shopping Reference" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  shoppingReferenceNode = self->_shoppingReferenceNode;
  self->_shoppingReferenceNode = v35;

  v37 = [[CLSSignalNode alloc] initWithIdentifier:2147483643 name:@"Junk - Utility Reference" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  utilityReferenceNode = self->_utilityReferenceNode;
  self->_utilityReferenceNode = v37;

  self->_legacyNode = [[CLSSignalNode alloc] initWithIdentifier:0x7FFFFFFFLL name:@"Junk - Legacy" operatingPoint:0.1 highPrecisionOperatingPoint:0.1 highRecallOperatingPoint:0.1];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSJunkClassificationModel *)self initWithSceneAnalysisVersion:86];
}

- (CLSJunkClassificationModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSJunkClassificationModel;
  id v4 = [(CLSJunkClassificationModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x56)
    {
      if (a3 < 0x51)
      {
        if (a3 < 0x28)
        {
          if (a3 < 0x20)
          {
            if (a3 == 31)
            {
              [(CLSJunkClassificationModel *)v4 setupVersion31];
            }
            else
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v6 = objc_opt_class();
                *(_DWORD *)buf = 67109378;
                int v10 = a3;
                __int16 v11 = 2112;
                uint64_t v12 = v6;
                _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
              }

              return 0;
            }
          }
          else
          {
            [(CLSJunkClassificationModel *)v4 setupVersion32];
          }
        }
        else
        {
          [(CLSJunkClassificationModel *)v4 setupVersion40];
        }
      }
      else
      {
        [(CLSJunkClassificationModel *)v4 setupVersion81];
      }
    }
    else
    {
      [(CLSJunkClassificationModel *)v4 setupVersion86];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 86;
}

+ (NSString)name
{
  return (NSString *)@"Junk Classification";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 81;
  uint64_t v4 = 40;
  uint64_t v5 = 32;
  if (a3 == 31) {
    uint64_t v6 = 31;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a3 <= 0x1F) {
    uint64_t v5 = v6;
  }
  if (a3 <= 0x27) {
    uint64_t v4 = v5;
  }
  if (a3 <= 0x50) {
    unint64_t v3 = v4;
  }
  if (a3 <= 0x55) {
    return v3;
  }
  else {
    return 86;
  }
}

@end