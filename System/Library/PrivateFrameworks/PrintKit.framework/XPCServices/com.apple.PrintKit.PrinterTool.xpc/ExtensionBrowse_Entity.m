@interface ExtensionBrowse_Entity
- (ExtensionBrowse_Entity)initWithURL:(id)a3 displayName:(id)a4 txtRecord:(id)a5 extensionIdentifier:(id)a6;
- (id)bonjourName;
- (id)displayName;
- (id)txtRecordDictionary;
@end

@implementation ExtensionBrowse_Entity

- (ExtensionBrowse_Entity)initWithURL:(id)a3 displayName:(id)a4 txtRecord:(id)a5 extensionIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ExtensionBrowse_Entity;
  v15 = [(ExtensionBrowse_Entity *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_printerURL, a3);
    objc_storeStrong((id *)&v16->_displayName, a4);
    objc_storeStrong((id *)&v16->_txtRecord, a5);
    objc_storeStrong((id *)&v16->_extensionIdentifier, a6);
  }

  return v16;
}

- (id)displayName
{
  return self->_displayName;
}

- (id)txtRecordDictionary
{
  return self->_txtRecord;
}

- (id)bonjourName
{
  id v2 = [objc_alloc((Class)PKPrinterBonjourEndpoint) initWithURL:self->_printerURL txtRecord:self->_txtRecord provenance:2 provenanceIdentifier:self->_extensionIdentifier];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_printerURL, 0);
}

@end