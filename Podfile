platform :ios, '13.0'

target 'Flash Chat iOS13' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Flash Chat iOS13
  pod 'CLTypingLabel'
  
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'IQKeyboardManagerSwift', '6.3.0'
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end
  
end
