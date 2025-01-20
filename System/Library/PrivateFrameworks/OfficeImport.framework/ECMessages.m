@interface ECMessages
+ (void)initialize;
@end

@implementation ECMessages

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [TCTaggedMessage alloc];
    v3 = TCBundle();
    v4 = [v3 localizedStringForKey:@"Password protection on sheets was removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v5 = [(TCTaggedMessage *)v2 initWithMessageText:v4];
    v6 = (void *)ECPasswordProtectedSheet;
    ECPasswordProtectedSheet = v5;

    v7 = [TCTaggedMessage alloc];
    v8 = TCBundle();
    v9 = [v8 localizedStringForKey:@"Pivot tables aren\\U2019t supported and were converted to regular tables." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v10 = [(TCTaggedMessage *)v7 initWithMessageText:v9];
    v11 = (void *)ECPivotTables;
    ECPivotTables = v10;

    v12 = [TCTaggedMessage alloc];
    v13 = TCBundle();
    v14 = [v13 localizedStringForKey:@"Sparklines aren\\U2019t supported and were ignored." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v15 = [(TCTaggedMessage *)v12 initWithMessageText:v14];
    v16 = (void *)ECUnsupportedSparklines;
    ECUnsupportedSparklines = v15;

    v17 = [TCTaggedMessage alloc];
    v18 = TCBundle();
    v19 = [v18 localizedStringForKey:@"This document was created with an unsupported version of Excel." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v20 = [(TCTaggedMessage *)v17 initWithMessageText:v19];
    v21 = (void *)ECUnsupportedVersion;
    ECUnsupportedVersion = v20;

    v22 = [TCTaggedMessage alloc];
    v23 = TCBundle();
    v24 = [v23 localizedStringForKey:@"Cells outside the limits of iWork tables were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v25 = [(TCTaggedMessage *)v22 initWithMessageText:v24];
    v26 = (void *)ECCellsOutsideLassoBoundary;
    ECCellsOutsideLassoBoundary = v25;

    v27 = [TCTaggedMessage alloc];
    v28 = TCBundle();
    v29 = [v28 localizedStringForKey:@"Some formulas couldn\\U2019t be imported. Last values were retained." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v30 = [(TCTaggedMessage *)v27 initWithMessageText:v29];
    v31 = (void *)ECUnsupportedImportFormula;
    ECUnsupportedImportFormula = v30;

    v32 = [TCTaggedMessage alloc];
    v33 = TCBundle();
    v34 = [v33 localizedStringForKey:@"A column or row was too large and was resized. Shapes and charts might look different." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v35 = [(TCTaggedMessage *)v32 initWithMessageText:v34];
    v36 = (void *)ECColumnOrRowTooBig;
    ECColumnOrRowTooBig = v35;

    v37 = [TCTaggedMessage alloc];
    v38 = TCBundle();
    v39 = [v38 localizedStringForKey:@"Some formulas couldn\\U2019t be exported. Last values were retained." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v40 = [(TCTaggedMessage *)v37 initWithMessageText:v39];
    v41 = (void *)ECUnsupportedExportFormula;
    ECUnsupportedExportFormula = v40;

    v42 = [TCTaggedMessage alloc];
    uint64_t v43 = [(TCTaggedMessage *)v42 initWithMessageText:kWarningMessageNoConditionalFormats];
    v44 = (void *)ECTUnsupportedConditionalFormat;
    ECTUnsupportedConditionalFormat = v43;

    v45 = [TCTaggedMessage alloc];
    v46 = TCBundle();
    v47 = [v46 localizedStringForKey:@"Content too long to fit in table cells was removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v48 = [(TCTaggedMessage *)v45 initWithMessageText:v47];
    v49 = (void *)ECStringTooLong;
    ECStringTooLong = v48;

    v50 = [TCTaggedMessage alloc];
    v51 = TCBundle();
    objc_msgSend(v51, "localizedStringForKey:value:table:", @"The document contains more colors than are supported; some colors might look different.",
      &stru_26EBF24D8,
    v52 = @"TCCompatibility");
    uint64_t v53 = [(TCTaggedMessage *)v50 initWithMessageText:v52];
    v54 = (void *)ECTooManyColors;
    ECTooManyColors = v53;

    v55 = [TCTaggedMessage alloc];
    v56 = TCBundle();
    v57 = [v56 localizedStringForKey:@"A font size was too large and was resized." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    uint64_t v58 = [(TCTaggedMessage *)v55 initWithMessageText:v57];
    v59 = (void *)ECFontSizeTooLarge;
    ECFontSizeTooLarge = v58;

    objc_opt_class();
  }
}

@end