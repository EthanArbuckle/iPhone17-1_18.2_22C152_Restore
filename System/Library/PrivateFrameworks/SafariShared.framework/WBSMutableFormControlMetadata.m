@interface WBSMutableFormControlMetadata
- (id)debugDescription;
- (void)setActive:(BOOL)a3;
- (void)setAddressBookLabel:(id)a3;
- (void)setAncestorFrameURLs:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setAutoFillButtonType:(int64_t)a3;
- (void)setAutoFilledTextField:(BOOL)a3;
- (void)setAutocompleteTokens:(id)a3;
- (void)setClaimsToBeCurrentPasswordViaAutocompleteAttribute:(BOOL)a3;
- (void)setClaimsToBeNewPasswordViaAutocompleteAttribute:(BOOL)a3;
- (void)setClaimsToBeUsernameViaAutocompleteAttribute:(BOOL)a3;
- (void)setClassification:(id)a3;
- (void)setContinuationID:(unint64_t)a3;
- (void)setContinuationIndex:(unint64_t)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisallowsAutocomplete:(BOOL)a3;
- (void)setFieldClass:(id)a3;
- (void)setFieldID:(id)a3;
- (void)setFieldName:(id)a3;
- (void)setLabeledUsernameField:(BOOL)a3;
- (void)setLastAutoFillButtonType:(int64_t)a3;
- (void)setLooksLikeCreditCardCardholderField:(BOOL)a3;
- (void)setLooksLikeCreditCardCompositeExpirationDateField:(BOOL)a3;
- (void)setLooksLikeCreditCardNumberField:(BOOL)a3;
- (void)setLooksLikeCreditCardSecurityCodeField:(BOOL)a3;
- (void)setLooksLikeCreditCardTypeField:(BOOL)a3;
- (void)setLooksLikeDayField:(BOOL)a3;
- (void)setLooksLikeEIDField:(BOOL)a3;
- (void)setLooksLikeIMEIField:(BOOL)a3;
- (void)setLooksLikeIgnoredDataTypeField:(BOOL)a3;
- (void)setLooksLikeMonthField:(BOOL)a3;
- (void)setLooksLikeOneTimeCodeField:(BOOL)a3;
- (void)setLooksLikePasswordCredentialField:(BOOL)a3;
- (void)setLooksLikeYearField:(BOOL)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setMinLength:(unint64_t)a3;
- (void)setNextControlUniqueID:(id)a3;
- (void)setOneTimeCodeIsEligibleForAutomaticLogin:(BOOL)a3;
- (void)setPasswordRules:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setRadioButtonInfo:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setRectHeight:(double)a3;
- (void)setRectLeft:(double)a3;
- (void)setRectTop:(double)a3;
- (void)setRectWidth:(double)a3;
- (void)setRequiredFormatForDateTimeInput:(id)a3;
- (void)setSecureTextField:(BOOL)a3;
- (void)setSelectElementInfo:(id)a3;
- (void)setSelectionLength:(unint64_t)a3;
- (void)setSelectionStart:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
- (void)setTagName:(id)a3;
- (void)setTextField:(BOOL)a3;
- (void)setUniqueID:(id)a3;
- (void)setUserEditedTextField:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setVerticalWritingMode:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)setassociatedUsername:(id)a3;
@end

@implementation WBSMutableFormControlMetadata

- (void)setVisible:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFBFFFF | v3);
}

- (void)setActive:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFF7FFFF | v3);
}

- (void)setDisabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFEFFFFF | v3);
}

- (void)setReadOnly:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFDFFFFF | v3);
}

- (void)setTextField:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFBFFFFF | v3);
}

- (void)setSecureTextField:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFF7FFFFF | v3);
}

- (void)setAutoFilledTextField:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFEFFFFFF | v3);
}

- (void)setUserEditedTextField:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFDFFFFFF | v3);
}

- (void)setLabeledUsernameField:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFBFFFFFF | v3);
}

- (void)setVerticalWritingMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xF7FFFFFF | v3);
}

- (void)setDisallowsAutocomplete:(BOOL)a3
{
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFFFE | a3);
}

- (void)setClaimsToBeCurrentPasswordViaAutocompleteAttribute:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFFFD | v3);
}

- (void)setClaimsToBeNewPasswordViaAutocompleteAttribute:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFFFB | v3);
}

- (void)setClaimsToBeUsernameViaAutocompleteAttribute:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFFF7 | v3);
}

- (void)setLooksLikeCreditCardCardholderField:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFFEF | v3);
}

- (void)setLooksLikeCreditCardCompositeExpirationDateField:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFFDF | v3);
}

- (void)setLooksLikeCreditCardNumberField:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFFBF | v3);
}

- (void)setLooksLikeCreditCardSecurityCodeField:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFF7F | v3);
}

- (void)setLooksLikeCreditCardTypeField:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFEFF | v3);
}

- (void)setLooksLikeEIDField:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFDFF | v3);
}

- (void)setLooksLikeIMEIField:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFFBFF | v3);
}

- (void)setLooksLikeDayField:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFF7FF | v3);
}

- (void)setLooksLikeMonthField:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFEFFF | v3);
}

- (void)setLooksLikeYearField:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFDFFF | v3);
}

- (void)setLooksLikeIgnoredDataTypeField:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFFBFFF | v3);
}

- (void)setLooksLikePasswordCredentialField:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFF7FFF | v3);
}

- (void)setLooksLikeOneTimeCodeField:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFEFFFF | v3);
}

- (void)setOneTimeCodeIsEligibleForAutomaticLogin:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags.flags = ($A7F5D94CC3E8F3FBDC6125808ECD2078)(*(_DWORD *)&self->super._flags.flags & 0xFFFDFFFF | v3);
}

- (void)setAddressBookLabel:(id)a3
{
  v4 = (NSString *)[a3 copy];
  addressBookLabel = self->super._addressBookLabel;
  self->super._addressBookLabel = v4;
}

- (void)setassociatedUsername:(id)a3
{
  v4 = (NSString *)[a3 copy];
  associatedUsername = self->super._associatedUsername;
  self->super._associatedUsername = v4;
}

- (void)setFieldClass:(id)a3
{
  v4 = (NSString *)[a3 copy];
  fieldClass = self->super._fieldClass;
  self->super._fieldClass = v4;
}

- (void)setFieldID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  fieldID = self->super._fieldID;
  self->super._fieldID = v4;
}

- (void)setFieldName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  fieldName = self->super._fieldName;
  self->super._fieldName = v4;
}

- (void)setTagName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  tagName = self->super._tagName;
  self->super._tagName = v4;
}

- (void)setUniqueID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  uniqueID = self->super._uniqueID;
  self->super._uniqueID = v4;
}

- (void)setNextControlUniqueID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  nextControlUniqueID = self->super._nextControlUniqueID;
  self->super._nextControlUniqueID = v4;
}

- (void)setPlaceholder:(id)a3
{
  v4 = (NSString *)[a3 copy];
  placeholder = self->super._placeholder;
  self->super._placeholder = v4;
}

- (void)setValue:(id)a3
{
  v4 = (NSString *)[a3 copy];
  value = self->super._value;
  self->super._value = v4;
}

- (void)setPasswordRules:(id)a3
{
  v4 = (NSString *)[a3 copy];
  passwordRules = self->super._passwordRules;
  self->super._passwordRules = v4;
}

- (void)setRequiredFormatForDateTimeInput:(id)a3
{
  v4 = (NSString *)[a3 copy];
  requiredFormatForDateTimeInput = self->super._requiredFormatForDateTimeInput;
  self->super._requiredFormatForDateTimeInput = v4;
}

- (void)setClassification:(id)a3
{
  v4 = (NSString *)[a3 copy];
  classification = self->super._classification;
  self->super._classification = v4;
}

- (void)setRectLeft:(double)a3
{
  self->super._rectLeft = a3;
}

- (void)setRectTop:(double)a3
{
  self->super._rectTop = a3;
}

- (void)setRectWidth:(double)a3
{
  self->super._rectWidth = a3;
}

- (void)setRectHeight:(double)a3
{
  self->super._rectHeight = a3;
}

- (void)setSize:(unint64_t)a3
{
  int v3 = 0x80000;
  if (a3 < 0x80000) {
    int v3 = a3;
  }
  self->super._size = v3;
}

- (void)setMaxLength:(unint64_t)a3
{
  int v3 = 0x80000;
  if (a3 < 0x80000) {
    int v3 = a3;
  }
  self->super._maxLength = v3;
}

- (void)setMinLength:(unint64_t)a3
{
  int v3 = 0x80000;
  if (a3 < 0x80000) {
    int v3 = a3;
  }
  self->super._minLength = v3;
}

- (void)setSelectionStart:(unint64_t)a3
{
  int v3 = 0x80000;
  if (a3 < 0x80000) {
    int v3 = a3;
  }
  self->super._selectionStart = v3;
}

- (void)setSelectionLength:(unint64_t)a3
{
  int v3 = 0x80000;
  if (a3 < 0x80000) {
    int v3 = a3;
  }
  self->super._selectionLength = v3;
}

- (void)setAutoFillButtonType:(int64_t)a3
{
  unint64_t v3 = a3 & ~(a3 >> 63);
  if (v3 >= 0x7FFFFFFF) {
    LODWORD(v3) = 0x7FFFFFFF;
  }
  self->super._autoFillButtonType = v3;
}

- (void)setLastAutoFillButtonType:(int64_t)a3
{
  unint64_t v3 = a3 & ~(a3 >> 63);
  if (v3 >= 0x7FFFFFFF) {
    LODWORD(v3) = 0x7FFFFFFF;
  }
  self->super._lastAutoFillButtonType = v3;
}

- (void)setContinuationID:(unint64_t)a3
{
  self->super._continuationID = a3;
}

- (void)setContinuationIndex:(unint64_t)a3
{
  self->super._continuationIndex = a3;
}

- (void)setAnnotations:(id)a3
{
  v4 = (NSDictionary *)[a3 copy];
  annotations = self->super._annotations;
  self->super._annotations = v4;
}

- (void)setRadioButtonInfo:(id)a3
{
  v4 = (NSDictionary *)[a3 copy];
  radioButtonInfo = self->super._radioButtonInfo;
  self->super._radioButtonInfo = v4;
}

- (void)setAutocompleteTokens:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  autocompleteTokens = self->super._autocompleteTokens;
  self->super._autocompleteTokens = v4;
}

- (void)setSelectElementInfo:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  selectElementInfo = self->super._selectElementInfo;
  self->super._selectElementInfo = v4;
}

- (void)setAncestorFrameURLs:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  ancestorFrameURLs = self->super._ancestorFrameURLs;
  self->super._ancestorFrameURLs = v4;
}

- (id)debugDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; unique id = %@; field name = %@; value = %@>",
               objc_opt_class(),
               self,
               self->super._uniqueID,
               self->super._fieldName,
               self->super._value);
}

@end