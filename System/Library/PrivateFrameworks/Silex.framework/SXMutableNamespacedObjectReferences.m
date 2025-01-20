@interface SXMutableNamespacedObjectReferences
- (void)addNamespacedIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5 map:(id)a6;
- (void)setNamespacedComponentStyleIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5;
- (void)setNamespacedComponentTextStyleIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5;
- (void)setNamespacedTextStyleIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5;
@end

@implementation SXMutableNamespacedObjectReferences

- (void)setNamespacedComponentStyleIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5
{
}

- (void)setNamespacedComponentTextStyleIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5
{
}

- (void)setNamespacedTextStyleIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5
{
}

- (void)addNamespacedIdentifier:(id)a3 forIdentifier:(id)a4 component:(id)a5 map:(id)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [(SXNamespacedObjectReferences *)self referencesForComponent:a5 map:a6];
  [v12 setObject:v11 forKey:v10];
}

@end