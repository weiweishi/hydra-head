@file_assets
Feature: List files for a document
  In order to see and manage the files uploaded into a document
  As an editor or non-editor
  I want to see a list of the current files with specified column headings and metadata
  # "Primary" column: Identifies which file is the primary file for the Article submission type
  # "File" column: displays icon identifying file type along with the file name
  # "Description": text describing the file
  # "Size" of file
  # "Uploaded" date and time (YYYY-MM-DD H:MM [A/P])
  # Summary information at bottom of table:
  # In the file column - total number of files
  # In the size column - total size of all uploaded files
  Background: 
    Given that "hydrangea:fixture_uploaded_svg1" has been loaded into fedora
  
  Scenario: Editor views the file list
    Given I am logged in as "archivist1@example.com"
    And I am on the file list page for hydrangea:fixture_mods_article1
    Then I should see a "th" element containing "File"
    Then I should see a link to "the file asset hydrangea:fixture_uploaded_svg1" with label "OM_MANI_PADME_HUM-bw.svg" in the file assets list     
		Then I should see "Delete this ActiveFedora::Base" in the file assets list  
 
  Scenario: Non-editor views the file list
    Given I am logged in as "permissionlessdude@example.com" 
    And I am on the file list page for hydrangea:fixture_mods_article1
    Then I should see a "th" element containing "File"
    Then I should see a link to "the file asset hydrangea:fixture_uploaded_svg1" with label "OM_MANI_PADME_HUM-bw.svg"
  	Then I should not see "Delete this ActiveFedora::Base" in the file assets list    
    

    